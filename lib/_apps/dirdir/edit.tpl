%{
get_post_args edit_wiki_page edit_text edit_preview edit_save

# XXX SECURITY HOLE! should sanitize form input and make sure we only edit files we are allowed
# This is a start, but should be way more careful
edit_file = `{echo $sitedir/$edit_wiki_page.md|sed 's/\.\.*/./g'}

if(! ~ $"edit_preview '') {
%}
            <H2>Preview:</H2>
            <div id="preview">
%               echo $edit_text | $formatter
            </div>
            <hr /><hr />
%{
}
if not if (! ~ $"edit_save '') {
    dirdir_dir = $edit_file^'_werc/dirdir/'

    if(! test -d  $dirdir_dir)
        mkdir -p $dirdir_dir

    dirdir_verdir = $dirdir_dir/`{date -n}^/
    mkdir $dirdir_verdir

    echo $loggin_user > $dirdir_verdir/author
    echo $edit_text > $dirdir_verdir/data 
    echo $edit_text > $edit_file
%}
<h1>Saved <a href="%($edit_wiki_page%)">%($edit_wiki_page%)!</a></h1>
%{
}
if not {
%}

<div>
    <h1>Editing %($req_path%)</h1>
    <br />
    <form action="/_apps/dirdir/edit" method="post">
        <input type="hidden" name="edit_wiki_page" value="%($edit_wiki_page%)"
        <textarea name="edit_text" id="edit_text" cols="80" rows="43">%{

if(~ $#edit_text 0 && test -f $edit_file)
    cat $edit_file | escape_html
if not
    echo $edit_text | escape_html

        %}</textarea>
        <br />
        <input type="submit" name="edit_save" value="Save"/>
        <input type="submit" name="edit_preview" value="Preview" />
        <small>DirDir documents are written using <a href="http://daringfireball.net/projects/markdown/syntax">Markdown syntax</a>.</small>
    </form>
</div>
% }

