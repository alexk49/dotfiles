" mixture of custom mappings nad changes to original
syntax match JournalTask '^\*\s'
syntax match JournalNotNeededTask '^\~\s.*$'
syntax match JournalHeading '^#\+.*$'
syntax match PriorityTask '^!\s.*$'  contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax match JournalNote '^-\s'
syntax match JournalEvent '^o\s'

" Other priority colours might be defined by the user
highlight  default  link  TodoDone       Comment
highlight  default  link  TodoPriorityA  Constant
highlight  default  link  TodoPriorityB  Statement
highlight  default  link  TodoPriorityC  Identifier
highlight  default  link  TodoDate       PreProc
highlight  default  link  TodoProject    Special
highlight  default  link  TodoContext    Function
highlight  default  link  JournalTask    Operator
highlight  default  link  JournalNotNeededTask    Comment
highlight  default  link  JournalHeading    Statement
highlight  default  link  PriorityTask    Todo
highlight  default  link  JournalNote    Label
highlight  default  link  JournalEvent    Identifier
