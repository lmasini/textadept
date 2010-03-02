-- Copyright 2007-2010 Mitchell Foral mitchell<att>caladbolg.net. See LICENSE.
-- This is a DUMMY FILE used for making LuaDoc for built-in functions in the
-- global buffer table.

---
-- The current buffer in the currently focused view.
-- It also represents the structure of any buffer table in 'buffers'.
module('buffer')

-- Markdown:
-- ## Fields
--
-- * `doc_pointer`: The pointer to the document associated with this buffer.
--   (Used internally; read-only)
-- * `dirty`: Flag indicating whether or not the buffer has been modified since
--   it was last saved.
-- * `filename`: The absolute path to the file associated with this buffer. It
--   is encoded in UTF-8. Use [`textadept.iconv()`][textadept_iconv] for
--   charset conversions.
-- * `encoding`: The encoding of the file on the hard disk. It will be nil if
--   the file is a binary file.
-- * `encoding_bom`: The byte-order mark of the file encoding (if any).
-- * `additional_caret_fore`: The foreground color of additional carets.
-- * `additional_carets_blink`: The rate in milliseconds at which additional
--   carets blink.
-- * `additional_carets_visible`: Flag indicating whether or not additional
--   carets are visible.
-- * `additional_sel_alpha`: The alpha of additional selections.
-- * `additional_sel_back`: The background color of additional selections.
-- * `additional_sel_fore`: The foreground color of additional selections.
-- * `additional_selection_typing`: Flag indicating whether or not typing,
--   backspace, or delete works with multiple selections simultaneously.
-- * `anchor`: The position of the opposite end of the selection to the caret.
-- * `auto_c_auto_hide`: Flag indicating whether or not autocompletion is hidden
--   automatically when nothing matches.
-- * `auto_c_cancel_at_start`: Flag indicating whether or not autocompletion
--   should be cancelled if the user backspaces to a position before where it
--   was created.
-- * `auto_c_choose_single`: Flag indicating whether or not a single item in
--   autocompletion should be chosen automatically.
-- * `auto_c_drop_rest_of_word`: Flag indicating whether or not autocompletion
--   deletes any word characters after the inserted text upon completion.
-- * `auto_c_fill_ups`: A string of characters that when typed will cause the
--   autocompletion to choose the selected item.
-- * `auto_c_ignore_case`: Flag indicating whether or not case is significant
--   when performing autocompletion searches.
-- * `auto_c_max_height`: The maximum height in rows of autocompletion and user
--   lists. Default is 5.
-- * `auto_c_max_width`: The maximum width in characters of autocompletion and
--   user lists.
-- * `auto_c_type_separator`: The (integer) type separator character in the
--   string setting up an autocompletion list.
-- * `back_space_un_indents`: Flag indicating whether or not a backspace press
--   when the caret is within indentation unindents.
-- * `buffered_draw`: Flag indicating whether or not text is drawn into a buffer
--   first or directly onto the screen.
-- * `call_tip_back`: The background [color][color] for the call tip.
--   (Write-only)
-- * `call_tip_fore`: The foreground [color][color] for the call tip.
--   (Write-only)
-- * `call_tip_fore_hlt`: The foreground [color][color] for the highlighted part
--   of the call tip.
-- * `call_tip_use_style`: Call tip tab size in pixels. (Enables
--   `STYLE_CALLTIP`.)
-- * `caret_fore`: The foreground [color][color] of the caret.
-- * `caret_line_back`: The [color][color] of the background of the line
--   containing the caret.
-- * `caret_line_back_alpha`: The background alpha of the caret line.
-- * `caret_line_visible`: Flag indicating whether or not the background of the
--   line containing the caret is a different color.
-- * `caret_period`: The time in milliseconds that the caret is on and off. 0 is
--   a steady on.
-- * `caret_sticky`: Flag indicating whether or not the caret preferred x
--   position can only be changed by explicit movement commands.
-- * `caret_style`: The style of the caret to be drawn.<br />
--       * 0: invisible
--       * 1: line
--       * 2: block
-- * `caret_width`: The width of the insert mode caret in pixels.
-- * `char_at`: The character byte at given index position. (Read-only)
-- * `code_page`: The code page used to interpret the bytes of the document as
--   characters.
-- * `column`: The column number of an index position, taking tab width into
--   account.
-- * `control_char_symbol`: The character used to display control characters.
--   (< 32 uses that control character)
-- * `current_pos`: The position of the caret.
-- * `cursor`: The cursor type.<br />
--       * -1: normal
--       * 4: wait.
-- * `direct_function`: The pointer to a function that processes messages for
--   this Scintilla. (Read-only)
-- * `direct_pointer`: The pointer value to use as the first function argument
--   when calling the function returned by direct_function.
-- * `eol_mode`: The end of line mode.<br />
--       * 0: `CRLF`
--       * 1: `CR`
--       * 2: `LF`
-- * `edge_colour`: The [color][color] used in edge indication.
-- * `edge_column`: The column number which text should be kept within.
-- * `edge_mode`: The edge highlight mode.<br />
--       * 0: None
--       * 1: Line
--       * 2: Background
-- * `end_at_last_line`: Flag indicating whether or not the maximum scroll
--   position has the last line at the bottom of the view. Default is true.
-- * `end_styled`: The position of the last correctly styled character.
--   (Read-only)
-- * `first_visible_line`: The display line at the top of the display.
-- * `focus`: The internal focus flag.
-- * `fold_expanded`: Flag indicating whether or not an indexed (header) line
--   has been expanded.
-- * `fold_level`: The fold level of an indexed line.<br />
--       * 0x400: Base
--       * 0x1000: White
--       * 0x2000: Header
--       * 0x0FFF: Number mask
-- * `fold_parent`: The parent line of indexed (child) line. (Read-only)
-- * `font_quality`: The font quality (antialiasing method). (Windows only)<br />
--       * 0: Default
--       * 1: Non-antialiased
--       * 2: Antialiased
--       * 3: LCD Optimized
-- * `h_scroll_bar`: Flag indicating whether or not the horizontal scroll bar is
--   visible.
-- * `highlight_guide`: The highlighted indentation guide column.
-- * `hotspot_active_underline`: Flag indicating whether or not active hotspots
--   are underlined.
-- * `hotspot_single_line`: Flag indicating whether or not hotspots are limited
--   to a single line so hotspots on two lines do not merge.
-- * `indent`: The indentation size.
-- * `indentation_guides`: Flag indicating whether or not indentation guides are
--   visible.
-- * `indic_fore`: The foreground [color][color] of an indexed indicator.
-- * `indic_style`: The style of an indexed indicator.<br />
--       * 0: Plain
--       * 1: Squiggle
--       * 2: TT
--       * 3: Diagonal
--       * 4: Strike
--       * 5: Hidden
--       * 6: Box
--       * 7: Roundbox.
-- * `indic_under`: Flag indicating whether or not an indexed indicator is drawn
--   over text. Default is `true`.
-- * `indicator_current`: The indicator used for `indicator_fill_range` and
--   `indicator_clear_range`.
-- * `indicator_value`: The value used for `indicator_fill_range`.
-- * `key_words`: Unused.
-- * `layout_cache`: The degree of caching of layout information.
-- * `length`: The number of characters in the document. (Read-only).
-- * `lexer`: The (integer) lexing language of the document.
-- * `line_count`: The number of lines in the document (>= 1). (Read-only).
-- * `line_end_position`: The position after the last visible character on an
--   index line. (Read-only)
-- * `line_indent_position`: The position before the first non-indentation
--   character on an indexed line. (Read-only)
-- * `line_indentation`: The number of columns an indexed line is indented.
-- * `line_state`: Extra styling information of an indexed line.
-- * `line_visible`: Flag indicating whether or not the indexed line is visible.
--   (Read-only)
-- * `lines_on_screen`: The number of lines completely visible. (Read-only)
-- * `main_selection`: The main selection.
-- * `margin_left`: The size in pixels of the left margin.
-- * `margin_mask_n`: The marker mask of an indexed margin.
-- * `margin_right`: The size in pixels of the right margin.
-- * `margin_sensitive_n`: Flag indicating whether or not the indexed margin is
--   sensitive to mouse clicks.
-- * `margin_type_n`: The type of an indexed margin.<br />
--       * 0: Symbolic
--       * 1: Numeric
-- * `margin_width_n`: The width of an indexed margin in pixels.
-- * `max_line_state`: The last line number that has a line state. (Read-only).
-- * `mod_event_mask`: Mask of modification events sent to the container.
-- * `modify`: Flag indicating whether or not the document is different from
--   when it was last saved.
-- * `mouse_down_captures`: Flag indicating whether or not the mouse is
--   captured when its button is pressed.
-- * `mouse_dwell_time`: The time in milliseconds the mouse must sit still to
--   generate a mouse dwell event.
-- * `multiple_selection`: Flag indicating whether or not to enable multiple
--   selection.
-- * `overtype`: Flag indicating whether or not overtype mode is active.
-- * `paste_convert_endings`: Flag indicating whether or not line endings are
--   converted when pasting text.
-- * `position_cache`: The number of entries in the position cache.
-- * `print_colour_mode`: The print color mode.<br />
--       * 0: Normal
--       * 1: Invert the light value of each style
--       * 2: Force black on white
--       * 3: Force background to be white
--       * 4: Only default background is forced to be white
-- * `print_magnification`: The print magnification added to the point size.
-- * `print_wrap_mode`: Wrap mode.<br />
--       * 0: None
--       * 1: Word
-- * `property`: The (string) value for a given (string) key index.
-- * `property_int`: The (integer) value for a given (string) key index.
--   (Read-only)
-- * `read_only`: Flag indicating whether or not the document is read-only.
-- * `rectangular_selection_anchor`: The position of the rectangular selection
--   anchor.
-- * `rectangular_selection_anchor_virtual_space`: The amount of virtual space
--   for the rectangular selection anchor.
-- * `rectangular_selection_caret`: The position of the rectangular selection
--   caret.
-- * `rectangular_selection_caret_virtual_space`: The amount of virtual space
--   for the rectangular selection caret.
-- * `rectangular_selection_modifier`: The key used to indicate that a
--   rectangular selection should be created when combined with a mouse drag.
--   <br />
--       * 2: Control
--       * 4: Alt
--       * 8: Super (Win)
-- * `scroll_width`: The document width assumed for scrolling.
-- * `scroll_width_tracking`: Flag indicating whether or not the maximum width
--   line displayed is used to set the scroll width.
-- * `search_flags`: The search flags used by `search_in_target`.
-- * `sel_alpha`: The alpha of the selection.
-- * `sel_eol_filled`: Flag indicating whether or not the selection end of line
--   is filled.
-- * `selection_end`: The position that ends the selection. (current_pos)
-- * `selection_is_rectangle`: Flag indicating whether or not the selection is
--   rectangular. (Read-only)
-- * `selection_mode`: The mode of the current selection.<br />
--       * 0: Stream
--       * 1: Rectangle
--       * 2: Lines
-- * `selection_n_anchor`: The position of the anchor for an existing selection.
-- * `selection_n_anchor_virtual_space`: The amount of virtual space for the
--   anchor for an existing selection.
-- * `selection_n_caret`: The position of the caret for an existing selection.
-- * `selection_n_caret_virtual_space`: The amount of virtual space for the
--   anchor for an existing selection.
-- * `selection_n_end`: The end position of an existing selection.
-- * `selection_n_start`: The start position of an existing selection.
-- * `selection_start`: The position that starts the selection. (anchor)
-- * `selections`: The number of selections currently active. (Read-only)
-- * `status`: error status. 0: OK.
-- * `style_at`: The style byte at the index position. (Read-only)
-- * `style_back`: The background [color][color] of an indexed style.
-- * `style_bits`: The number of bits in style bytes.
-- * `style_bits_needed`: The number of bits the current lexer needs for
--   styling. (Read-only)
-- * `style_bold`: Flag indicating whether or not the indexed style is bold.
-- * `style_case`: The case of an indexed style.<br />
--       * 0: Mixed
--       * 1: Upper
--       * 2: Lower
-- * `style_changeable`: Flag indicating whether or not the indexed style is
--   changeable.
-- * `style_character_set`: The character set of the font in the indexed style.
-- * `style_eol_filled`: Flag indicating whether or not the indexed style's end
--   of line is filled.
-- * `style_font`: The font of the indexed style.
-- * `style_fore`: The foreground [color][color] of the indexed style.
-- * `style_hot_spot`: Flag indicating whether or not the indexed style is a
--   hotspot.
-- * `style_italic`: Flag indicating whether or not the indexed style is italic.
-- * `style_size`: The font size of the indexed style.
-- * `style_underline`: Flag indicating whether or not the indexed style is
--   underlined.
-- * `style_visible`: Flag indicating whether or not the indexed style is
--   visible.
-- * `tab_indents`: Flag indicating whether or not a tab press when the caret
--   is within indentation indents.
-- * `tab_width`: The visible size of a tab in multiples of the width of a space
--   character.
-- * `target_end`: The position that ends the target which is used for updating
--   the document without affecting the scroll position.
-- * `target_start`: The position that starts the target which is used for
--   updating the document without affecting the scroll position.
-- * `text_length`: The number of characters in the document. (Read-only)
-- * `two_phase_draw`: Flag indicating whether or not drawing is performed in
--   two phases: background and then foreground.
-- * `undo_collection`: Flag indicating whether or not an undo history is being
--   collected.
-- * `use_palette`: Flag indicating whether or not Scintilla uses the env's
--   palette calls to display more colors.
-- * `use_tabs`: Flag indicating whether or not indentation uses tabs and spaces
--   or just spaces.
-- * `v_scroll_bar`: Flag indicating whether or not the vertical scroll bar is
--   visible.
-- * `view_eol`: Flag indicating whether or not end of line characters are
--   visible.
-- * `view_ws`: Flag indicating whether or not whitespace characters are visible.
-- * `virtual_space_options`: Options for enabling virtual space. <br />
--       * 0: Disabled.
--       * 1: Enabled only for rectangular selection.
--       * 2: Enabled.
-- * `whitespace_chars`: The set of characters making up whitespace when moving
--   or selecting by word. Should be called after setting word_chars.
--   (Write-only)
-- * `whitespace_size`: The size of the dots used for marking space characters.
-- * `word_chars`: The set of characters making up words when moving or
--   selecting by word. (Write-only)
-- * `wrap_mode`: Flag indicating whether or not text is word wrapped.
-- * `wrap_start_indent`: The start indent for wrapped lines.
-- * `wrap_visual_flags`: The display mode of visual flags for wrapped lines.
--   <br />
--       * 0: None
--       * 1: End
--       * 2: Start
-- * `wrap_visual_flags_location`: The location of visual flags for wrapped
--   lines.<br />
--       * 0: Default
--       * 1: End by text
--       * 2: Start by text
-- * `x_offset`: The horizontal scroll position.
-- * `zoom`: The zoom level added to all font sizes. +: magnify, -: reduce.
--
-- [textadept_iconv]: ../modules/textadept.html#iconv
-- [color]: http://scintilla.org/ScintillaDoc.html#colour

---
-- Gets a range of text from the current buffer.
-- The indexed buffer must be the currently focused one.
-- @param start_pos The beginning position of the range of text to get.
-- @param end_pos The end position of the range of text to get.
function buffer:text_range(start_pos, end_pos)

---
-- Deletes the current buffer.
-- The indexed buffer must be the currently focused one. WARNING: this function
-- should NOT be called via scripts. textadept.io provides a close() function
-- for buffers to prompt for confirmation if necessary; this function does not.
-- Activates the 'buffer_deleted' signal.
function buffer:delete()

--- Adds a new selection from anchor to caret as the main selection. All other
-- selections are retained as additional selections.
function buffer:add_selection(caret, anchor)
--- Adds text to the document at the current position.
function buffer:add_text(text)
--- Enlarges the document to a particular size of text bytes
function buffer:allocate(bytes)
--- Appends a string to the end of the document without changing the selection.
function buffer:append_text(text)
--- Returns a flag indicating whether or not an autocompletion list is visible.
function buffer:auto_c_active()
--- Removes the autocompletion list from the screen.
function buffer:auto_c_cancel()
--- Item selected; removes the list and insert the selection.
function buffer:auto_c_complete()
--- Returns the currently selected item position in the autocompletion list.
function buffer:auto_c_get_current()
--- Returns the currently selected text in the autocompletion list.
function buffer:auto_c_get_current_text()
--- Returns the position of the caret when the autocompletion list was shown.
function buffer:auto_c_pos_start()
--- Selects the item in the autocompletion list that starts with a string.
function buffer:auto_c_select(string)
--- Displays an autocompletion list.
-- @param len_entered The number of characters before the caret used to provide
--   the context.
-- @param item_list String if completion items separated by spaces.
function buffer:auto_c_show(len_entered, item_list)
--- Defines a set of characters that why typed cancel the autocompletion list.
function buffer:auto_c_stops(chars)
--- Dedents selected lines.
function buffer:back_tab()
--- Starts a sequence of actions that are undone/redone as a unit.
function buffer:begin_undo_action()
--- Highlights the character at a position indicating there's no matching brace.
function buffer:brace_bad_light(pos)
--- Highlights the characters at two positions as matching braces.
function buffer:brace_highlight(pos1, pos2)
--- Returns the position of a matching brace at a position or -1.
function buffer:brace_match(pos)
--- Returns a flag indicating whether or not a call tip is active.
function buffer:call_tip_active()
--- Removes the call tip from the screen.
function buffer:call_tip_cancel()
--- Returns the position where the caret was before showing the call tip.
function buffer:call_tip_pos_start()
--- Highlights a segment of a call tip.
function buffer:call_tip_set_hlt(start_pos, end_pos)
--- Shows a call tip containing text at or near a position.
function buffer:call_tip_show(pos, text)
--- Returns a flag indicating whether or not a paste will succeed.
function buffer:can_paste()
--- Returns a flag indicating whether or not there are redoable actions in the
-- undo history.
function buffer:can_redo()
--- Returns a flag indicating whether or not there are redoable actions in the
-- undo history.
function buffer:can_undo()
--- Cancels any modes such as call tip or autocompletion list display.
function buffer:cancel()
--- Moves the caret left one character.
function buffer:char_left()
--- Moves the caret left one character, extending the selection.
function buffer:char_left_extend()
--- Moves the caret left one character, extending the rectangular selection.
function buffer:char_left_rect_extend()
--- Moves the caret right one character.
function buffer:char_right()
--- Moves the caret right one character, extending the selection.
function buffer:char_right_extend()
--- Moves the caret right one character, extending the rectangular selection.
function buffer:char_right_rect_extend()
--- Sets the last x chosen value to be the caret x position.
function buffer:choose_caret_x()
--- Clears the selection.
function buffer:clear()
--- Deletes all text in the document.
function buffer:clear_all()
--- Drops all key mappings.
function buffer:clear_all_cmd_keys()
--- Sets all style bytes to 0, remove all folding information.
function buffer:clear_document_style()
--- Clears all the registered XPM images.
function buffer:clear_registered_images()
--- Clears all selections.
function buffer:clear_selections()
--- Colorizes a segment of the document using the current lexing language.
function buffer:colourise(start_pos, end_pos)
--- Converts all line endings in the document to one mode.
-- @param mode The line ending mode. 0: CRLF, 1: CR, 2: LF.
function buffer:convert_eo_ls(mode)
--- Copies the selection to the clipboard.
function buffer:copy()
--- Copies a range of text to the clipboard.
function buffer:copy_range(start_pos, end_pos)
--- Copies argument text to the clipboard.
function buffer:copy_text(text)
--- Cuts the selection to the clipboard.
function buffer:cut()
--- Deletes back from the current position to the start of the line.
function buffer:del_line_left()
--- Deletes forwards from the current position to the end of the line.
function buffer:del_line_right()
--- Deletes the word to the left of the caret.
function buffer:del_word_left()
--- Deletes the word to the right of the caret.
function buffer:del_word_right()
--- Deletes the selection or the character before the caret.
function buffer:delete_back()
--- Deletes the selection or the character before the caret. Will not delete the
-- character before at the start of a lone.
function buffer:delete_back_not_line()
--- Returns the document line of a display line taking hidden lines into
-- account.
function buffer:doc_line_from_visible()
--- Moves the caret to the last position in the document.
function buffer:document_end()
--- Moves the caret to the last position in the document, extending the
-- selection.
function buffer:document_end_extend()
--- Moves the caret to the first position in the document.
function buffer:document_start()
--- Moves the caret to the first position in the document, extending the
-- selection.
function buffer:document_start_extend()
--- Switches from insert to overtype mode or the reverse.
function buffer:edit_toggle_overtype()
--- Deletes the undo history.
function buffer:empty_undo_buffer()
--- Translates a UTF8 string into the document encoding and returns its length.
function buffer:encoded_from_utf8(string)
--- Ends a sequence of actions that is undone/redone as a unit.
function buffer:end_undo_action()
--- Ensures a particular line is visible by expanding any header line hiding it.
function buffer:ensure_visible(line)
--- Ensures a particular line is visible by expanding any header line hiding it.
-- Uses the currently set visible policy to determine which range to display.
function buffer:ensure_visible_enforce_policy(line)
--- Returns the position of the column on a line taking into account tabs and
-- multi-byte characters or the line end position.
function buffer:find_column(line, column)
--- Inserts a form feed character.
function buffer:form_feed()
--- Returns the text of the line containing the caret and the index of the caret
-- on the line.
function buffer:get_cur_line()
--- Returns the background color for active hotspots.
function buffer:get_hotspot_active_back()
--- Returns the foreground color for active hotspots.
function buffer:get_hotspot_active_fore()
--- Returns the last child line of a header line.
function buffer:get_last_child(header_line, level)
--- Returns the name of the lexing language used by the document.
function buffer:get_lexer_language()
--- Returns the contents of a line.
function buffer:get_line(line)
--- Returns the position of the end of the selection at the given line or -1.
function buffer:get_line_sel_end_position(line)
--- Returns the position of the start of the selection at the given line or -1.
function buffer:get_line_sel_start_position(line)
--- Returns the value of a property.
function buffer:get_property(property)
--- Returns the value of a property with "$()" variable replacement.
function buffer:get_property_expanded()
--- Returns the selected text.
function buffer:get_sel_text()
--- Returns the name of the style associated with a style number.
function buffer:get_style_name(style_num)
--- Returns all text in the document and its length.
function buffer:get_text()
--- Sets the caret to the start of a line and ensure it is visible.
function buffer:goto_line(line)
--- Sets the caret to a position and ensure it is visible.
function buffer:goto_pos(pos)
--- Sets the focus to this Scintilla widget.
function buffer:grab_focus()
--- Makes a range of lines invisible.
function buffer:hide_lines(start_line, end_line)
--- Draws the selection in normal style or with the selection highlighted.
function buffer:hide_selection(normal)
--- Moves the caret to the first position on the current line.
function buffer:home()
--- Moves the caret to the first position on the display line.
function buffer:home_display()
--- Moves the caret to the first position on the display line, extending the
-- selection.
function buffer:home_display_extend()
--- Moves the caret to the first position on the current line, extending the
-- selection.
function buffer:home_extend()
--- Moves the caret to the first position on the current line, extending the
-- rectangular selection.
function buffer:home_rect_extend()
--- Moves the caret to the start of the current display line and then the
-- document line. (If word wrap is enabled)
function buffer:home_wrap()
--- Moves the caret to the start of the current display line and then the
-- document line, extending the selection. (If word wrap is enabled)
function buffer:home_wrap_extend()
--- Returns a flag indicating whether or not any indicators are present at the
-- specified position.
function buffer:indicator_all_on_for(pos)
--- Turns an indicator off over a range.
function buffer:indicator_clear_range(pos, clear_length)
--- Returns the position where a particular indicator ends.
function buffer:indicator_end(indicator, pos)
--- Turns an indicator on over a range.
function buffer:indicator_fill_range(pos, fill_length)
--- Returns the position where a particular indicator starts.
function buffer:indicator_start(indicator, pos)
--- Returns the value of a particular indicator at the specified position.
function buffer:indicator_value_at(indicator, pos)
--- Inserts text at a position. -1 is the document's length.
function buffer:insert_text(pos, text)
--- Copies the line containing the caret.
function buffer:line_copy()
--- Cuts the line containing the caret.
function buffer:line_cut()
--- Deletes the line containing the caret.
function buffer:line_delete()
--- Moves the caret down one line.
function buffer:line_down()
--- Moves the caret down one line, extending the selection.
function buffer:line_down_extend()
--- Moves the caret down one line, extending the rectangular selection.
function buffer:line_down_rect_extend()
--- Duplicates the current line.
function buffer:line_duplicate()
--- Moves the caret to the last position on the current line.
function buffer:line_end()
--- Moves the caret to the last position on the display line.
function buffer:line_end_display()
--- Moves the caret to the last position on the display line, extending the
-- selection.
function buffer:line_end_display_extend()
--- Moves the caret to the last position on the current line, extending the
-- selection.
function buffer:line_end_extend()
--- Moves the caret to the last position on the current line, extending the
-- rectangular selection.
function buffer:line_end_rect_extend()
--- Moves the caret to the last position on the current display line and then
-- the document line. (If wrap mode is enabled)
function buffer:line_end_wrap()
--- Moves the caret to the last position on the current display line and then
-- the document line, extending the selection. (If wrap mode is enabled)
function buffer:line_end_wrap_extend()
--- Returns the line containing the position.
function buffer:line_from_position(pos)
--- Returns the length of the specified line including EOL characters.
function buffer:line_length(line)
--- Scrolls horizontally and vertically the number of columns and lines.
function buffer:line_scroll(columns, lines)
--- Scrolls the document down, keeping the caret visible.
function buffer:line_scroll_down()
--- Scrolls the document up, keeping the caret visible.
function buffer:line_scroll_up()
--- Switches the current line with the previous.
function buffer:line_transpose()
--- Moves the caret up one line.
function buffer:line_up()
--- Moves the caret up one line, extending the selection.
function buffer:line_up_extend()
--- Moves the caret up one line, extending the rectangular selection.
function buffer:line_up_rect_extend()
--- Joins the lines in the target.
function buffer:lines_join()
--- Splits lines in the target into lines that are less wide that pixel_width
-- where possible.
function buffer:lines_split(pixel_width)
--- Loads a lexer library (dll/so)
function buffer:load_lexer_library(path)
--- Transforms the selection to lower case.
function buffer:lower_case()
--- Adds a marker to a line, returning an ID which can be used to find or delete
-- the marker.
function buffer:marker_add(line, marker_num)
--- Adds a set of markers to a line.
function buffer:marker_add_set(line, set)
--- Sets the symbol used for a particular marker number.
function buffer:marker_define(marker_num, marker_symbol)
--- Defines a marker from a pixmap.
function buffer:marker_define_pixmap(marker_num, pixmap)
--- Deletes a marker from a line.
function buffer:marker_delete(line, marker_num)
--- Deletes all markers with a particular number from all lines.
function buffer:marker_delete_all(marker_num)
--- Deletes a marker.
function buffer:marker_delete_handle(handle)
--- Gets a bit mask of all the markers set on a line.
function buffer:marker_get(line)
--- Returns the line number at which a particular marker is located.
function buffer:marker_line_from_handle(handle)
--- Finds the next line after start_line that includes a marker in marker_mask.
function buffer:marker_next(start_line, marker_mask)
--- Finds the previous line after start_line that includes a marker in
-- marker_mask.
function buffer:marker_previous(start_line, marker_mask)
--- Sets the alpha used for a marker that is drawn in the text area, not the
-- margin.
function buffer:marker_set_alpha(marker_num, alpha)
--- Sets the background color used for a particular marker number.
function buffer:marker_set_back(marker_num, color)
--- Sets the foreground color used for a particular marker number.
function buffer:marker_set_fore(marker_num, color)
--- Moves the caret inside the current view if it's not there already.
function buffer:move_caret_inside_view()
--- Inserts a new line depending on EOL mode.
function buffer:new_line()
--- Null operation
function buffer:null()
--- Moves the caret one page down.
function buffer:page_down()
--- Moves the caret one page down, extending the selection.
function buffer:page_down_extend()
--- Moves the caret one page down, extending the rectangular selection.
function buffer:page_down_rect_extend()
--- Moves the caret one page up.
function buffer:page_up()
--- Moves the caret one page up, extending the selection.
function buffer:page_up_extend()
--- Moves the caret one page up, extending the rectangular selection.
function buffer:page_up_rect_extend()
--- Moves the caret one paragraph down (delimited by empty lines).
function buffer:para_down()
--- Moves the caret one paragraph down (delimited by empty lines), extending the
-- selection.
function buffer:para_down_extend()
--- Moves the caret one paragraph up (delimited by empty lines).
function buffer:para_up()
--- Moves the caret one paragraph up (delimited by empty lines), extending the
-- selection.
function buffer:para_up_extend()
--- Pastes the contents of the clipboard into the document replacing the
-- selection.
function buffer:paste()
--- Returns the x value of the point in the window where a position is shown.
function buffer:point_x_from_position(pos)
--- Returns the y value of the point in the window where a position is shown.
function buffer:point_y_from_position(pos)
--- Returns the next position in the document taking code page into account.
function buffer:position_after(pos)
--- Returns the previous position in the document taking code page into account.
function buffer:position_before(pos)
--- Returns the position at the start of the specified line.
function buffer:position_from_line(line)
--- Returns the position from a point within the window.
function buffer:position_from_point(x, y)
--- Returns the position from a point within the window, but return -1 if not
-- close to text.
function buffer:position_from_point_close(x, y)
--- Redoes the next action in the undo history.
function buffer:redo()
--- Registers and XPM image for use in autocompletion lists.
function buffer:register_image(type, xmp_data)
--- Replaces the selected text with the argument text.
function buffer:replace_sel(text)
--- Replaces the target text with the argument text.
function buffer:replace_target(text)
--- Replaces the target text with the argument text after \d processing.
-- Looks for \d where d is 1-9 and replaces it with the strings captured by a
-- previous RE search.
function buffer:replace_target_re(text)
--- Makes the next selection the main selection.
function buffer:rotate_selection()
--- Ensures the caret is visible.
function buffer:scroll_caret()
--- Sets the current caret position to be the search anchor.
function buffer:search_anchor()
--- Searches for a string in the target and sets the target to the found range,
-- returning the length of the range or -1.
function buffer:search_in_target(text)
--- Finds some text starting at the search anchor. (Does not scroll selection)
-- @param flags Mask of search flags. 2: whole word, 4: match case, 0x00100000:
--   word start, 0x00200000 regexp, 0x00400000: posix.
function buffer:search_next(flags, text)
--- Finds some text starting at the search anchor and moving backwards. (Does
-- not scroll the selection)
-- @param flags Mask of search flags. 2: whole word, 4: match case, 0x00100000:
--   word start, 0x00200000 regexp, 0x00400000: posix.
function buffer:search_prev(flags, text)
--- Selects all the text in the document.
function buffer:select_all()
--- Duplicates the selection or the line containing the caret.
function buffer:selection_duplicate()
--- Resets the set of characters for whitespace and word characters to the
-- defaults.
function buffer:set_chars_default()
--- Sets some style options for folding.
-- @param flags Mask of fold flags. 0x0002: line before expanded, 0x0004: line
--   before contracted, 0x0008: line after expanded, 0x0010: line after
--   contracted, 0x0040: level numbers, 0x0001: box.
function buffer:set_fold_flags(flags)
--- Sets the background color used as a checkerboard pattern in the fold margin.
function buffer:set_fold_margin_colour(use_setting, color)
--- Sets the foreground color used as a checkerboard pattern in the fold margin.
function buffer:set_fold_margin_hi_colour(use_setting, color)
--- Sets a background color for active hotspots.
function buffer:set_hotspot_active_back(use_setting, color)
--- Sets a foreground color for active hotspots.
function buffer:set_hotspot_active_fore(use_setting, color)
--- Sets the length of the utf8 argument for calling encoded_from_utf8.
function buffer:set_length_for_encode(bytes)
--- Sets the lexer language to the specified name.
function buffer:set_lexer_language(language_name)
--- Remembers the current position in the undo history as the position at which
-- the document was saved.
function buffer:set_save_point()
--- Selects a range of text.
function buffer:set_sel(start_pos, end_pos)
--- Sets the background color of the selection and whether to use this setting.
function buffer:set_sel_back(use_setting, color)
--- Sets the foreground color of the selection and whether to use this setting.
function buffer:set_sel_fore(use_setting, color)
--- Set a single selection from anchor to caret as the only selection.
function buffer:set_selection(caret, anchor)
--- Changes the style from the current styling position for a length of
-- characters to a style and move the current styling position to after this
-- newly styled segment.
function buffer:set_styling(length, style)
--- Sets the styles for a segment of the document.
function buffer:set_styling_ex(length, styles)
--- Replaces the contents of the document with the argument text.
function buffer:set_text(text)
--- Sets the way the display area is determined when a particular line is to be
-- moved to by find, find_next, goto_line, etc.
-- @param visible_policy 0x01: slop, 0x04: strict.
-- @param visible_slop 0x01: slop, 0x04: strict.
function buffer:set_visible_policy(visible_policy, visible_slop)
--- Sets the background color of all whitespace and whether to use this setting.
function buffer:set_whitespace_back(use_setting, color)
--- Sets the foreground color of all whitespace and whether to use this setting.
function buffer:set_whitespace_fore(use_setting, color)
--- Sets the way the caret is kept visible when going side-ways.
-- @param caret_policy 0x01: slop, 0x04: strict, 0x10: jumps, 0x08: even.
function buffer:set_x_caret_policy(caret_policy, caret_slop)
--- Sets the way the line the caret is visible on is kept visible.
-- @param caret_policy 0x01: slop, 0x04: strict, 0x10: jumps, 0x08: even.
function buffer:set_y_caret_policy(caret_policy, caret_slop)
--- Makes a range of lines visible.
function buffer:show_lines(start_line, end_line)
--- Starts notifying the container of all key presses and commands.
function buffer:start_record()
--- Sets the current styling position to pos and the styling mask to mask.
function buffer:start_styling(position, mask)
--- Stops notifying the container of all key presses and commands.
function buffer:stop_record()
--- Moves caret to the bottom of the page, or one page down if already there.
function buffer:stuttered_page_down()
--- Moves caret to the bottom of the page, or one page down if already there,
-- extending the selection.
function buffer:stuttered_page_down_extend()
--- Moves caret to the top of the page, or one page up if already there.
function buffer:stuttered_page_up()
--- Moves caret to the top of the page, or one page up if already there,
-- extending the selection.
function buffer:stuttered_page_up_extend()
--- Resets all styles to the global default style.
function buffer:style_clear_all()
--- Returns the font name of a given style.
function buffer:style_get_font(style_num)
--- Resets the default style to its state at startup.
function buffer:style_reset_default()
--- Moves the caret to the opposite end of the main selection.
function buffer:swap_main_anchor_caret()
--- Inserts a tab character or indent multiple lines.
function buffer:tab()
--- Returns the target converted to utf8.
function buffer:target_as_utf8()
--- Makes the target range the same as the selection range.
function buffer:target_from_selection()
--- Returns the height of a particular line of text in pixels.
function buffer:text_height(line)
--- Returns the pixel width of some text in a particular style.
function buffer:text_width(style_num, text)
--- Switches the caret between sticky and non-sticky.
function buffer:toggle_caret_sticky()
--- Switches a header line between expanded and contracted.
function buffer:toggle_fold()
--- Undoes one action in the undo history.
function buffer:undo()
--- Transforms the selection to upper case.
function buffer:upper_case()
--- Sets whether a pop up menu is displayed automatically when the user presses
-- the right mouse button.
function buffer:use_pop_up(allow_popup)
--- Displays a list of strings and sends a notification when one is chosen.
function buffer:user_list_show(list_type, item_list_string)
--- Moves the caret to before the first visible character on the current line
-- or the first character on the line if already there.
function buffer:vc_home()
--- Moves the caret to before the first visible character on the current line
-- or the first character on the line if already there, extending the selection.
function buffer:vc_home_extend()
--- Moves the caret to before the first visible character on the current line
-- or the first character on the line if already there, extending the
-- rectangular selection.
function buffer:vc_home_rect_extend()
--- Moves the caret to the first visible character on the current display line
-- and then the document line. (If wrap mode is enabled)
function buffer:vc_home_wrap()
--- Moves the caret to the first visible character on the current display line
-- and then the document line, extending the selection. (If wrap mode is
-- enabled)
function buffer:vc_home_wrap_extend()
--- Returns the display line of a document line taking hidden lines into
-- account.
function buffer:visible_from_doc_line(line)
--- Returns the position of the end of a word.
function buffer:word_end_position(pos, only_word_chars)
--- Moves the caret left one word.
function buffer:word_left()
--- Moves the caret left one word, positioning the caret at the end of the word.
function buffer:word_left_end()
--- Moves the caret left one word, positioning the caret at the end of the word,
-- extending the selection.
function buffer:word_left_end_extend()
--- Moves the caret left one word, extending the selection.
function buffer:word_left_extend()
--- Moves the caret to the previous change in capitalization or underscore.
function buffer:word_part_left()
--- Moves the caret to the previous change in capitalization or underscore,
-- extending the selection.
function buffer:word_part_left_extend()
--- Moves the caret to the next change in capitalization or underscore.
function buffer:word_part_right()
--- Moves the caret to the next change in capitalization or underscore,
-- extending the selection.
function buffer:word_part_right_extend()
--- Moves the caret right one word.
function buffer:word_right()
--- Moves the caret right one word, positioning the caret at the end of the
-- word.
function buffer:word_right_end()
--- Moves the caret right one word, positioning the caret at the end of the
-- word, extending the selection.
function buffer:word_right_end_extend()
--- Moves the caret right one word, extending the selection.
function buffer:word_right_extend()
--- Returns the position of a start of a word.
function buffer:word_start_position(pos, only_word_chars)
--- Returns the number of display lines needed to wrap a document line.
function buffer:wrap_count(line)
--- Magnifies the displayed text by increasing the font sizes by 1 point.
function buffer:zoom_in()
--- Makes the displayed text smaller by decreasing the font sizes by 1 point.
function buffer:zoom_out()

---
-- @see textadept.io.reload
function buffer:reload()
---
-- @see textadept.io.set_encoding
function buffer:set_encoding()
---
-- @see textadept.io.save
function buffer:save()
---
-- @see textadept.io.save_as
function buffer:save_as()
---
-- @see textadept.io.close
function buffer:close()
