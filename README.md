# vim-tabpopupmenu

Add popup menu for tab.

```text
+Tab Menu-------------+
| n: New tab          |
| o: Open tab         |
| c: Close tab        |
| O: Close others     |
| <: Close left tabs  |
| >: Close right tabs |
| H: Move to left     |
| L: Move to right    |
| ^: Show first       |
| h: Show left        |
| l: Show right       |
| $: Show last        |
+---------------------+
```

## Install

Example

- dein
  ```vim
  call dein#add('utubo/vim-tabpopupmenu')
  ```

- Mapping
  ```vim
  nnoremap <silent> <Leader>t :<C-u>call tabpopupmenu#popup()<CR>
  ```

