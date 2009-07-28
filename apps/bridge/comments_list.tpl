<hr>
<h2>Comments</h2>

% for(c in `{ls $comments_dir/}) {
%    if(test -s $c/body) {
        <div class="comment">
            <h5>By: <i>%(`{cat $c/user}%)</i></b> (%(`{cat $c/posted}%))
        </h5>
%       cat $c/body | escape_html | sed 's,$,<br>,'
        <hr></div>
%    }
% }

