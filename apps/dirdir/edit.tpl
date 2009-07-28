<div>
    <h1>Editing: <a href="%($req_path%)">%($req_path%)</a></h1>
    <br>
    <form action="" method="POST">
        <textarea name="edit_text" id="edit_text" cols="80" rows="43">%{
# FIXME Extra trailing new lines get added to the content somehow, should avoid it.
            if(~ $#post_arg_edit_text 0 && test -f $dirdir_file)
                cat $dirdir_file | escape_html
            if not
                echo -n $post_arg_edit_text | escape_html

        %}</textarea>
        <br>
        <input type="submit" name="dirdir_save" value="Save">
        <input type="submit" name="dirdir_preview" value="Preview">
        <small>DirDir documents are written using <a href="http://daringfireball.net/projects/markdown/syntax">Markdown syntax</a>.</small>
    </form>
</div>

% if(! ~ $"post_arg_dirdir_preview '') {
            <h2>Preview:</h2>
            <div id="preview">
%               echo $post_arg_edit_text | $formatter
            </div>
% }
