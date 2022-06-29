# vim-tabpopupmenu

Add the popupmenu for tab.

```text
+Tab Menu-------------+
| o: Close others     |
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
