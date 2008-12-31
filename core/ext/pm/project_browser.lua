-- Copyright 2007-2008 Mitchell Foral mitchell<att>caladbolg.net. See LICENSE.

---
-- Browser template for the Textadept project manager.
-- It is enabled with the prefix 'project' in the project manager entry field.
module('textadept.pm.browsers.project', package.seeall)

local lfs = require 'lfs'
local os = require 'os'

local project_file -- path to the project file

---
-- Table containing the directory structure of the project.
-- @class table
-- @name project_root
local project_root

-- functions
local load_project, update_project, get_parent_folder, get_live_parent_folder
local refresh_view = textadept.pm.activate

--- Matches 'project'.
function matches(entry_text)
  return entry_text:sub(1, 7) == 'project'
end

---
-- Returns the files in the parent directory or project root.
-- If the directory is a live folder, get the directory contents from the
-- filesystem and add them to the 'project' table. Any directories are labeled
-- as live folders for the same process.
-- Displays nice names only (all characters after last '/' or '\')
function get_contents_for(full_path)
  local contents = {}
  if project_file then
    local project_folder = get_parent_folder(full_path)
    if not project_folder.is_live_folder then
      for k, v in pairs(project_folder) do
        if type(k) == 'number' then -- file
          contents[v] = { text = v:match('[^/\\]+$') }
        else -- folder
          contents[k] = {
            parent = true,
            text = k:match('[^/\\]+$'),
            pixbuf = 'gtk-directory'
          }
        end
      end
    else
      local dirpath = full_path[#full_path]
      for name in lfs.dir(dirpath) do
        if not name:match('^%.') then -- ignore hidden files
          local filepath = dirpath..'/'..name
          contents[filepath] = { text = name }
          if lfs.attributes(dirpath..'/'..name, 'mode') == 'directory' then
            contents[filepath].parent = true
            contents[filepath].pixbuf = 'gtk-directory'
            project_folder[filepath] = { is_live_folder = true }
          else
            project_folder[#project_folder + 1] = name
          end
        end
      end
    end
  end
  return contents
end

--- Opens the selected project file.
function perform_action(selected_item)
  textadept.io.open( selected_item[#selected_item] )
  view:focus()
end

--- Displays the project manager context menu.
function get_context_menu(selected_item)
  return {
    'separator', -- make it harder to click 'New Project' by mistake
    '_New Project',
    '_Open Project',
    '_Close Project',
    'separator',
    'Add New File',
    'Add Existing Files',
    'Add New Directory',
    'Add Existing Director_y',
    '_Delete',
    '_Rename',
  }
end

function perform_menu_action(menu_item, selected_item)
  if menu_item == 'New Project' then
    -- Close all open files and prompt the user to save a project file.
    if textadept.io.close_all() then
      local file = cocoa_dialog( 'filesave', {
        title = 'Save Project',
        ['with-directory'] = (buffer.filename or ''):match('.+[/\\]'),
        ['no-newline'] = true
      } )
      if #file > 0 then
        project_file = file
        project_root = {}
        update_project()
      end
    end

  elseif menu_item == 'Open Project' then
    -- Close all open files and prompt the user for a project file to open.
    if textadept.io.close_all() then
      local file = cocoa_dialog( 'fileselect', {
        title = 'Open Project',
        ['with-directory'] = (buffer.filename or ''):match('.+[/\\]'),
        ['no-newline'] = true
      } )
      if #file > 0 then
        load_project(file)
        refresh_view()
      end
    end

  elseif menu_item == 'Close Project' then
    -- Close all open files and clear the project variables.
    if textadept.io.close_all() then
      project_file = nil
      project_root = nil
      textadept.pm.clear()
    end

  elseif menu_item == 'Add New File' then
    -- If a project is open, prompts the user to save the new file.
    if project_file then
      local dir = get_live_parent_folder(selected_item)
      local file = cocoa_dialog( 'filesave', {
        title = 'Save File',
        ['with-directory'] = dir or project_file:match('.+[/\\]'),
        ['no-newline'] = true
      } )
      if #file > 0 then
        local function add_file_to(pfolder)
          local exists = false
          for _, v in ipairs(pfolder) do
            if v == file then exists = true break end
          end
          if not exists then pfolder[#pfolder + 1] = file end
          update_project()
          refresh_view()
        end
        local project_folder = get_parent_folder(selected_item)
        if not project_folder.is_live_folder then
          add_file_to(project_folder)
        else
          -- If the user is saving to a different folder than was selected,
          -- caution them about unexpected behavior and ask to save in the
          -- project root instead.
          if dir and file:match('^(.+)[/\\]') ~= dir then
            local ret = cocoa_dialog( 'yesno-msgbox', {
              text = 'Add to Project Root Instead?',
              ['informative-text'] = 'You are adding a new file to a live '..
                'folder which may not show up if the filepaths do not match.'..
                '\nAdd the file to the project root instead?',
              ['no-newline'] = true
            } )
            if ret == '1' then add_file_to(project_root) end
            if ret == '3' then return end
          end
        end
        local f = io.open(file, 'w') f:write('') f:close()
        update_project()
        refresh_view()
      end
    end

  elseif menu_item == 'Add Existing Files' then
    -- If a project is open, prompts the user to add existing files.
    -- If the directory the files are being added to is a live folder, the user
    -- is asked to add the files to the project root instead of the live folder
    -- because adding to the latter is not possible.
    -- Files are added if they do not already exist in the project. This does
    -- not always apply when live folders are in a project.
    if project_file then
      local files = cocoa_dialog( 'fileselect', {
        title = 'Select Files',
        text = 'Select files to add to the project',
        -- in Windows, dialog:get_filenames() is unavailable; only allow single
        -- selection
        ['select-multiple'] = not WIN32 or nil,
        ['with-directory'] = (buffer.filename or project_file):match('.+[/\\]')
      } )
      if #files > 0 then
        local function add_files_to(pfolder)
          for file in files:gmatch('[^\n]+') do
            local exists = false
            for _, v in ipairs(pfolder) do
              if v == file then exists = true break end
            end
            if not exists then pfolder[#pfolder + 1] = file end
          end
          update_project()
          refresh_view()
        end
        local project_folder = get_parent_folder(selected_item)
        if not project_folder.is_live_folder then
          add_files_to(project_folder)
        else
          if cocoa_dialog( 'yesno-msgbox', {
            text = 'Add to Project Root Instead?',
            ['informative-text'] = 'You are adding existing files to a live '..
              'folder which is not possible.\nAdd them to the project root '..
              'instead?',
            ['no-newline'] = true,
          } ) == '1' then add_files_to(project_root) end
        end
      end
    end

  elseif menu_item == 'Add New Directory' then
    -- If a project is open, prompts the user for a directory name to add.
    -- This only works if the directory the directory is being added to is not a
    -- live directory.
    -- The directory is added if it does not already exist in the project. This
    -- does not always apply when live folders are in a project.
    if project_file then
      local ret, name = cocoa_dialog( 'standard-inputbox', {
        ['informative-text'] = 'Directory Name?',
        ['no-newline'] = true
      } ):match('^(%d)\n([^\n]+)$')
      if ret == '1' and name and #name > 0 then
        local project_folder = get_parent_folder(selected_item)
        if not project_folder.is_live_folder then
          if not project_folder[name] then project_folder[name] = {} end
        else
          lfs.mkdir( get_live_parent_folder(selected_item)..'/'..name )
        end
        update_project()
        refresh_view()
      end
    end

  elseif menu_item == 'Add Existing Directory' then
    -- If a project is open, prompts the user for an existing directory to add.
    -- If the directory the directory being added to is a live folder, the user
    -- is asked to add the directory to the project root instead of the live
    -- folder because adding to the latter is not possible.
    -- The directory is added if it does not already exist in the project. This
    -- does not always apply when live folders are in a project.
    if project_file then
      local dir = cocoa_dialog( 'fileselect', {
        title = 'Select Directory',
        text = 'Select a directory to add to the project',
        ['select-only-directories'] = true,
        ['with-directory'] = (buffer.filename or ''):match('.+[/\\]'),
        ['no-newline'] = true
      } )
      if #dir > 0 then
        local function add_directory_to(pfolder)
          if not pfolder[dir] then
            pfolder[dir] = { is_live_folder = true }
            update_project()
            refresh_view()
          end
        end
        local project_folder = get_parent_folder(selected_item)
        if not project_folder.is_live_folder then
          add_directory_to(project_folder)
        else
          if cocoa_dialog( 'yesno-msgbox', {
            text = 'Add to Project Root Instead?',
            ['informative-text'] = 'You are adding an existing directory to '..
              'a live folder which is not possible.\nAdd it to the project '..
              'root instead?',
            ['no-newline'] = true,
          } ) == '1' then add_directory_to(project_root) end
        end
      end
    end

  elseif menu_item == 'Delete' then
    -- If a project is open, deletes the file from the project unless it is
    -- contained in a live folder.
    if project_file then
      local project_folder = get_parent_folder(selected_item)
      local item = selected_item[#selected_item]
      if not project_folder.is_live_folder then
        if project_folder[item] then -- directory
          table.remove(selected_item, #selected_item)
          local parent_folder = get_parent_folder(selected_item)
          parent_folder[item] = nil
        else -- file
          for i, file in ipairs(project_folder) do
            if file == item then
              local ret = cocoa_dialog( 'yesno-msgbox', {
                text = 'Keep on Disk?',
                ['informative-text'] = 'This file will be removed from the '..
                  'project.\nLeave it on your computer? If not, it will be '..
                  'permanently deleted.',
                ['no-newline'] = true
              } )
              if ret == '2' then os.remove(file) end
              if ret == '3' then return end
              table.remove(project_folder, i)
              break
            end
          end
        end
      else
        local function remove_directory(dirpath)
          for name in lfs.dir(dirpath) do
            if not name:match('^%.%.?$') then os.remove(dirpath..'/'..name) end
          end
          lfs.rmdir(dirpath)
        end
        local item_is_dir = lfs.attributes(item, 'mode') == 'directory'
        -- If the selection to delete is a live folder and the parent is not,
        -- ask the user if they want to delete it permanently in addition to
        -- removing it from the project.
        table.remove(selected_item, #selected_item)
        local parent_folder = get_parent_folder(selected_item)
        if item_is_dir and not parent_folder.is_live_folder then
          local ret = cocoa_dialog( 'yesno-msgbox', {
            text = 'Keep on Disk?',
            ['informative-text'] = 'This directory will be removed from the '..
              'project.\nLeave it on your computer? If not, it will be '..
              'permanently deleted.',
            ['no-newline'] = true
          } )
          if ret == '2' then remove_directory(item) end
          if ret == '3' then return end
          parent_folder[item] = nil
        else
          if cocoa_dialog( 'msgbox', {
            text = 'Delete Permanently?',
            ['informative-text'] = 'You have selected a file from a live '..
              'folder to delete.\nIt will be deleted permanently. Continue?\n'..
              '(To delete a live folder from the project, select the highest '..
              'level live folder.)',
            ['no-newline'] = true,
            button1 = 'No',
            button2 = 'Yes',
            button3 = 'Cancel',
          } ) ~= '2' then return end
          if item_is_dir then remove_directory(item) else os.remove(item) end
        end
      end
      update_project()
      refresh_view()
    end

  elseif menu_item == 'Rename' then
    -- If a project is open, prompts the user for a new file/directory name.
    if project_file then
      local ret, name = cocoa_dialog( 'standard-inputbox', {
        ['informative-text'] = 'New Name?',
        ['no-newline'] = true
      } ):match('^(%d)\n([^\n]+)$')
      if ret == '1' and name and #name > 0 then
        local oldname = selected_item[#selected_item]
        local newname = oldname:match('^.+[/\\]')..name
        local project_folder = get_parent_folder(selected_item)
        if not project_folder.is_live_folder then
          if lfs.attributes(oldname, 'mode') == 'directory' then
            table.remove(selected_item, #selected_item)
            local parent_folder = get_parent_folder(selected_item)
            parent_folder[newname] = parent_folder[oldname]
            parent_folder[oldname] = nil
          else
            for i, file in ipairs(project_folder) do
              if file == oldname then table.remove(project_folder, i) break end
            end
            project_folder[#project_folder + 1] = newname
          end
        else
          -- If the directory being renamed is live directory and the parent is
          -- not, rename it through the parent.
          -- (If the live directory is not top level or the file is in a live
          -- directory, refresh_view() will be enough.)
          if lfs.attributes(oldname, 'mode') == 'directory' then
            table.remove(selected_item, #selected_item)
            local parent_folder = get_parent_folder(selected_item)
            if not parent_folder.is_live_folder then
              parent_folder[newname] = { is_live_folder = true }
              parent_folder[oldname] = nil
            end
          end
        end
        os.rename(oldname, newname)
        update_project()
        refresh_view()
      end
    end

  end
end

---
-- [Local function] Loads a given project file.
-- Sets the local 'project_file' and 'project' fields appropriately.
-- @param file The project file.
load_project = function(file)
  local f = io.open(file)
  project_root = loadstring('return '..f:read('*all'))()
  f:close()
  project_file = file
end

---
-- [Local function] Writes the current project to the project file.
update_project = function()
  local function write_folder(folder, f)
    for k, v in pairs(folder) do
      if type(k) == 'number' then -- file
        f:write("'"..v.."',\n")
      else -- directory
        f:write("['"..k.."'] = {\n")
        if not v.is_live_folder then
          write_folder(v, f)
        else
          f:write("is_live_folder = true")
        end
        f:write("\n},\n")
      end
    end
  end
  local f = io.open(project_file, 'w')
  f:write('{\n')
  write_folder(project_root, f)
  f:write('}')
  f:close()
end

---
-- [Local function] If the selected item is a folder, returns that; otherwise
-- returns the parent folder of the selected item.
-- Removes toplevel project manager entry text if necessary.
-- @param full_path The full_path or selected_item as given by:
--   get_contents_for, perform_action, get_context_menu, perform_menu_action.
-- @return the table object from the local 'project' field.
get_parent_folder = function(full_path)
  if full_path[1] and full_path[1]:sub(1, 7) == 'project' then
    table.remove(full_path, 1)
  end
  local pfolder = project_root
  for _, folder in ipairs(full_path) do
    if pfolder[folder] then pfolder = pfolder[folder] end
  end
  return pfolder
end

---
-- [Local function] If the selected item is a live folder, returns its path;
-- otherwise returns the path of the live parent folder of the selected
-- item.
-- @param full_path The full_path or selected_item as given by:
--   get_contents_for, perform_action, get_context_menu, perform_menu_action.
-- @return string path or nil.
get_live_parent_folder = function(selected_item)
  local dir = nil
  if get_parent_folder(selected_item).is_live_folder then
    if lfs.attributes(
      selected_item[#selected_item], 'mode' ) == 'directory' then
      dir = selected_item[#selected_item]
    else
      dir = selected_item[#selected_item - 1]
    end
  end
  return dir
end
