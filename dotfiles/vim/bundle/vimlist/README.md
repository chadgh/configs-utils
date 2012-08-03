# Vimlist

A small list manager.


## Configuration

In your .vimrc, add a line like this, with the directory modified to point to where you're storing your .list files:

> let g:vimlist_dir = "/path/to/your/lists"

To turn off the key mappings:

> let g:vimlist_map_keys = 0

To change the leader prefix:

> let g:vimlist_map_leader = '&lt;leader&gt;,'


## Default keys

* &lt;prefix&gt;o: add item to top of current list
* &lt;prefix&gt;O: add item to bottom of current list
* &lt;prefix&gt;g: jump to top of current list
* &lt;prefix&gt;G: jump to bottom of current list
* &lt;prefix&gt;j: jump to next list
* &lt;prefix&gt;k: jump to previous list
* &lt;prefix&gt;e: open another list
* &lt;tab&gt;: toggle folding for a list


## Snippet

Type `list` and hit tab to automatically create a new list.
