[**[Hyperpolyglot]{.underline}**](http://hyperpolyglot.org/)

Terminal Multiplexers: Screen, Tmux

[[command line options]{.underline}](http://hyperpolyglot.org/multiplexers#cmd-line-opts) \| [[key bindings]{.underline}](http://hyperpolyglot.org/multiplexers#key-bindings) \| [[customization]{.underline}](http://hyperpolyglot.org/multiplexers#customization) \| [[terminology]{.underline}](http://hyperpolyglot.org/multiplexers#terminology) \| [[documentation]{.underline}](http://hyperpolyglot.org/multiplexers#doc)

**Command Line Options**

```
                                          **screen**                                                **tmux**
```

------

  create session and attach                   \$ screen                                                 \$ tmux
  create session *foo* and attach             \$ screen -S foo                                          \$ tmux new -s foo
  create detached session *foo*               \$ screen -S foo -d -m                                    \$ tmux new -s foo -d
  list sessions                               \$ screen -list                                           \$ tmux ls
  attach                                      \$ screen -r                                              \$ tmux attach
  attach to session *foo*                     \$ screen -r foo                                          \$ tmux attach -t foo
  attach to session by pid                    \$ screen -r *pid*                                        
  kill session *foo*                          \$ screen -r foo -X quit                                  \$ tmux kill-session -t foo
  send multiplexer command to session *foo*   \$ screen -r foo -X *command*                             \$ tmux *command* -t foo
  run ls in session *foo*                     \$ screen -r foo -X stuff \"ls \$(echo -ne \'\\015\')\"   \$ tmux send-keys -t foo \'ls\' C-m
  run vi in new window                        \$ screen vi /etc/motd                                    \$ tmux new-window vi /etc/motd

**Key Bindings**

[[sessions]{.underline}](http://hyperpolyglot.org/multiplexers#sessions) \| [[windows]{.underline}](http://hyperpolyglot.org/multiplexers#windows) \| [[regions]{.underline}](http://hyperpolyglot.org/multiplexers#regions) \| [[panes]{.underline}](http://hyperpolyglot.org/multiplexers#panes) \| [[paste buffer]{.underline}](http://hyperpolyglot.org/multiplexers#paste-buffer) \| [[copy mode]{.underline}](http://hyperpolyglot.org/multiplexers#copy-mode)

------

```
                                            **screen**                             **tmux**                                             
```

------

```
                                            **C-a *cmd***                          **command**               **C-b *cmd***              **command**
```

  help                                          ?                                      :help                     ?                          :list-keys

  send prefix to app                            a                                      :meta                     C-b                        :send-prefix

  suspend multiplexer                           C-z                                    :suspend                  C-z                        :suspend-client

  show previous multiplexer message             m\                                     :lastmsg                  \~                         :show-messages
                                                C-m                                                                                         

  source file                                                                          :source *file*                                       :source-file *file*

  detach                                        d\                                     :detach                   d                          :detach-client
                                                C-d                                                                                         

  **sessions**                                                                                                                              

```
                                            **screen**                             **tmux**                                             

                                            **C-a *cmd***                          **command**               **C-b *cmd***              **command**
```

  new session                                                                                                                               :new

  new named session                                                                                                                         :new -s foo

  switch session                                                                                                 s                          :choose-session

  rename session                                                                       :sessionname foo          \$                         command-prompt -I \#S \"rename-session \'%%\'\"

  kill session                                  C-\\                                   :quit                                                

  **windows**                                                                                                                               

```
                                            **screen**                             **tmux**                                             

                                            **C-a *cmd***                          **command**               **C-b *cmd***              **command**
```

  create new window                             c\                                     :screen                   c                          :new-window
                                                C-c                                                                                         

  switch to next window                         n\                                     :next                     n                          :next-window
                                                C-n\                                                                                        
                                                SPACE                                                                                       

  switch to previous window                     BACKSPACE\                             :prev                     p                          :previous-window
                                                h\                                                                                          
                                                p\                                                                                          
                                                C-p                                                                                         

  toggle to last window                         C-a                                    :other                                               

  select window *n*                                                                                              *n*                        :select-window -t :*n*

  list windows                                  w\                                     :windows                                             :list-windows
                                                C-w                                                                                         

  show current window number and name           N                                      :number                                              

  renumber current window                                                                                        . *position*               :move-window

  move current window to another session                                                                         . *sessname*\              
                                                                                                                 . *sessnum*:*position*     

  redraw current window                         l\                                     :redisplay                r                          :refresh-client
                                                C-l                                                                                         

  choose window interactively                   \"                                     :windowlist -b            w                          :choose-window

  rename window                                 A                                      :title                    ,                          

  select window *foo*                           \'                                     :select                   f *foo*                    

  close current window                          C-k                                    :kill                     &                          :kill-window

  join window 1 to current window                                                                                                           :join-pane -s 1

  join region 0 of window 1 to current window                                                                                               :join-pane -s 1.0

  **regions**                                                                                                                               

```
                                            **screen**                             **tmux**                                             

                                            **C-a *cmd***                          **command**               **C-b *cmd***              **command**
```

  split into top and bottom regions             S                                      :split                                               

  move down to next region                      TAB                                    :focus                                               

  make regions same height                                                             :resize =                                            

  close current region                          X                                      :remove                                              

  close all but current region                  Q                                      :only                                                

  clear current region                          C                                      :clear                                               

  log region to file                                                                   *file is* screenlog.NN\                              
                                                                                       :log                                                 

  turn off logging                                                                     :log off                                             

  make current region *n* rows taller/shorter                                          :resize +*n*\                                        
                                                                                       :resize -*n*                                         

  make current region *n* rows tall                                                    :resize *n*                                          

  **panes**                                                                                                                                 

```
                                            **screen**                             **tmux**                                             

                                            **C-a *cmd***                          **command**               **C-b *cmd***              **command**
```

  split into left and right panes                                                                                \%                         :split-window -h

  split into top and bottom panes                                                                                \"                         :split-window

  switch to next panes                                                                                           o                          :select-pane

  rotate panes                                                                                                   C-o                        :rotate-window

  reverse rotate panes                                                                                           M-o                        :rotate-window -D

  arrange panes side-by-side and same width                                                                      M-1                        

  arrange panes stacked and same height                                                                          M-2                        

  swap current and previous pane                                                                                 {                          :swap-pane -U

  swap current and next pane                                                                                     }                          :swap-pane -D

  change arrangement of panes                                                                                    SPACE                      :next-layout

  close current pane                                                                                             x                          :confirm-before kill-pane

  break current pane into separate window                                                                        !                          :break-pane

  list panes                                                                                                                                :list-panes

  display pane numbers                                                                                           q                          :display-panes

  clear current pane                                                                                                                        :clear-history

  log pane to file                                                                                                                          :pipe-pane \"cat \> /tmp/tmux.log\"

  turn off logging                                                                                                                          :pipe-pane

  resize pane left/up *n* cells                                                                                                             :resize-pane -L *n*\
                                                                                                                                            :resize-pane -U *n*

  **paste buffer**                                                                                                                          

```
                                            **screen**                             **tmux**                                             

                                            **C-a *cmd***                          **command**               **C-b *cmd***              **command**
```

  enter copy mode                               \[\                                    :copy                     \[                         :copy-mode
                                                C-\[\                                                                                       
                                                ESC                                                                                         

  paste most recent buffer                      \]                                                               \]                         :paste-buffer

  list buffers                                  *only one buffer*                                                \#                         :list-buffers

  choose buffer to paste interactively                                                                           =                          :choose-buffer

  write buffer to file                          *writes to* /tmp/screen-exchange:\     :writebuf *path*                                     :save-buffer *path*
                                                \>                                                                                          

  copy file to buffer                           *copies from* /tmp/screen-exchange:\   :readbuf *path*                                      :load-buffer *path*
                                                \<                                                                                          

  **copy mode**                                                                                                                             

```
                                            **screen**                             **tmux**                                             

                                            ***cmd***                              **command**               ***cmd***                  **command**

```

  default bindings                              *Vim-style*                            *Emacs-style*                                        

  set mark                                      SPACE                                                            C-SPACE                    

  copy from mark to point and exit copy mode    *when mark is set:*\                                             C-w                        
                                                SPACE                                                                                       

  single column movement                        *also left right arrow*\                                         *also left right arrow*\   
                                                h l                                                              C-b C-h                    

  single line movement                          *also down up arrow*\                                            *also down up arrow*\      
                                                j k                                                              C-n C-p                    

  beginning of line                             0                                                                C-a                        

  end of line                                   \$                                                               C-e                        

  forward word                                  e                                                                M-f                        

  backward word                                 b                                                                M-b                        

  page up                                       C-b                                                              M-v                        

  page down                                     C-f                                                              C-v                        

  beginning of buffer                           g                                                                M-\<                       

  end of buffer                                 G                                                                M-\>                       

  search backwards                              ? *phrase*                                                       C-r *phrase*               

  search forwards                               / *phrase*                                                       C-s *phrase*               

  exit copy mode                                *any unbound key also works:*\                                   q                          

##                                                 ESC                                                                                         

**Customization**

------

```
                                      [**[screen]{.underline}**](http://hyperpolyglot.org/multiplexers#screen)                   [**[tmux]{.underline}**](http://hyperpolyglot.org/multiplexers#tmux)

```

------

  startup file                            \~/.screenrc                                                                               \~/.tmux.conf

  scrollback length                       defscrollback 2000                                                                         set-option history-limit 2000

  set prefix                              *how to set prefix to C-b, with a second C-b to send a C-b to the controlling process:*\   set-option -g prefix C-a
                                          escape \^B\^B                                                                              

  define key binding                      bind                                                                                       bind-key

  undefine key binding                                                                                                               unbind-key

  set copy/scrollback key binding style   *vi bindings by default.\                                                                  *emacs by default:*\
                                          When redefining, use vi\                                                                   setw -g mode-keys vi
                                          commands on left of equations:*\                                                           
                                          markkeys h=\^B:l=\^F:\$=\^E                                                                

  disable startup message                 startup\_message off                                                                       

  number windows from one                                                                                                            *0 by default:*\
                                                                                                                                     set -g base-index 1

  always show status bar                  *splitonly by default:*\                                                                   *on by default:*\
                                          caption always\                                                                            set-option status off\
                                          caption splitonly                                                                          set-option status on

  customize caption                       caption string \"*string*\"                                                                set-option status-left \"*string*\"\

##                                                                                                                                      set-option status-right *string*

------

  **caption escapes**                                                                         

------

```
                         **screen**                                                       **tmux**

```

  shell output               *first arg is an identifier referenced by the caption string;\   \#(*cmd*)
                             the second and third argument set the refresh in seconds*\       
                             \                                                                
                             backtick 1 60 60 *cmd*\                                          
                             caption always \"%1\`\"                                          

  date (YYYYMMDD)            \%Y%m%d                                                          

  month name                 \%M                                                              

  weekday name               \%D                                                              

  24 hr time                 \%C                                                              

  12 hr time                 \%c%A                                                            

  color                      \%{ry}*red text, yellow background*%{dd}foo                      \#\[fg=red,bg=yellow\]*red text, yellow background*\#\[default\]

  fully qualified hostname                                                                    \#H

  hostname                   \%H                                                              \#h

  session name               \%S *added in 4.1*                                               \#S

  current window flag        \%F                                                              \#F

  current window index       \%n                                                              \#I

  current pane index         *none*                                                           \#P

  current pane title         *none*                                                           \#T

  window name                \%t                                                              \#W

##   literal % or \#            \%%                                                              \#\#

**Terminology**

[[server]{.underline}](http://hyperpolyglot.org/multiplexers#def-server) \| [[client]{.underline}](http://hyperpolyglot.org/multiplexers#def-client) \| [[session]{.underline}](http://hyperpolyglot.org/multiplexers#def-session) \| [[window]{.underline}](http://hyperpolyglot.org/multiplexers#def-window) \| [[region]{.underline}](http://hyperpolyglot.org/multiplexers#def-region) \| [[pane]{.underline}](http://hyperpolyglot.org/multiplexers#def-pane)

**how ssh works:**

When a user logs in to a remote host using ssh, the ssh process contacts an sshd process listening on TCP port 22. The sshd process opens up a new TCP port and forks off a copy of itself for communicating with the ssh process. The new port and child process are for the exclusive use of the connection being established.

The child sshd process authenticates the ssh process, and if it passes it creates a pseudo-terminal. It then forks the remote user\'s shell which becomes the controlling process for the pseudo-terminal.

If the network connection is closed, either explicitly by the ssh process or because of a loss of network connectivity, the child sshd process closes the pseudo-terminal, and this in turn causes the shell to exit.

**the SIGHUP problem:**

If the shell had any process groups running when it exits, they are sent a SIGHUP signal followed by a SIGCONT signal. By default processes exit when they receive SIGHUP. This makes it challenging to run long-running jobs on a remote host when the network connection is unreliable.

A simple solution to the SIGHUP problem is to run each job with nohup. Optionally, shells such as bash and zsh have a disown built-in which can be used on a process that is already running, should the user have neglected to run it with nohup.

The fish shell when invoking a process in the background with & sets the signal handling state of the process to ignore SIGHUP. It will do the same if the process is suspended with \^Z and then put in the background with bg.

Multiplexers offer a solution which protects the shell instead of the job. The user doesn\'t need to remember to run each job with nohup. As an added benefit any state kept by the shell is preserved.

**server:**

The multiplexer server creates pseudo-terminals which are used for running and interacting with programs.

*Screen* and *Tmux* servers can create multiple pseudo-terminals. The controlling process for each pseudo-terminal is the user\'s shell.

**client:**

To see the output of a shell the user must connect to the multiplexer server with a multiplexer client process.

If the multiplexer is being run on a remote machine and the user\'s connection is lost, the server and its terminals and controlling processes persist, but the client process exits.

When multiple client processes connect to the same server they see the same output. This is a way to share a display across computers.

**session:**

Multiplexers support multiple sessions. Each multiplexer session has its own set of terminals and controlling processes which it is running. The client must choose a session to attach to, and will only be able to see the output of the controlling processes in that session. Sessions can be given names to make it easy for the client to choose the correct session.

*Screen* launches a separate server process for each session. *Screen* servers and clients communicate via named pipes.

*Tmux* by default will only run one server process per user, and this server process can have multiple sessions. A *Tmux* client and the server communicate via a Unix domain socket in the /tmp directory. The -L option can be used to specify a different socket; a new server is created for each socket.

**window:**

Both *Screen* and *Tmux* have entities which they call windows.

A *Screen* window has a single pseudo-terminal and shell. A *Tmux* window can have multiple pseudo-terminals and shells.

*Screen* windows can share the viewport. The *Tmux* viewport can only display one window at a time.

Both *Screen* and *Tmux* windows are numbered starting from zero.

**region:**

*Screen* can divide the viewport into multiple regions.

*Screen* regions can be empty or they can contain a window. The same window can be displayed in more than one region. When regions share a window their content is identical.

*Screen* regions are stacked on top of each other and extend the full width of the window.

**pane:**

*Tmux* can divide windows into multiple panes.

*Tmux* panes contain a single pseudo-terminal with a shell, and each pseudo-terminal and shell belongs to only one pane.

*Tmux* windows can be divided both horizontally and vertically into panes. Each division can be subdivided further.

*Tmux* panes are numbered.

*Tmux* panes can be moved between windows.

**command character (prefix):**

Multiplexers pass most input on to the shell in the region with focus, but a special command character is used to send commands to the multiplexer.

The default command character in *Screen* is C-a. The keystrokes which follow C-a are interpreted by *Screen* instead of being passed to the shell.

*Tmux* calls the command character the *prefix* and the default value is C-b. The keystrokes following the prefix are interpreted by *Tmux* instead of being passed to shell.

**scrollback buffer (history):**

*Screen* and *Tmux* keep a history of the output of each shell. The maximum length of the output in lines is configurable.

*Screen* calls the history the scrollback buffer.

**copy/scrollback mode (copy mode):**

*Screen* and *Tmux* support two modes for each region. In default mode, input which is not intercepted by the multiplexer is passed to the shell.

When the region is in copy mode the region behaves like a read-only buffer of an editor. The contents are the output of the shell including output that may have scrolled off the top of the region.

The keybindings used by *Screen* in copy/scrollback mode are Vim-style. It is possible to customize them to be Emacs-style.

The *Tmux* calls copy/scrollback mode simply copy mode. The keybindings are by default Emacs-style.

**paste buffer:**

*Screen* has a single paste buffer.

*Tmux* has multiple paste buffers. The *Tmux* paste buffers are numbered; the most recent is number zero. Sessions share a common paste buffer history.

**caption (status line):**

When a *Screen* window is split into multiple regions, a caption line is placed at the bottom of each region. When a window contains a single region, *Screen* by default does not display a caption. The caption, when present, contains information from *Screen*. The information that is displayed can be customized.

*Tmux* calls the line at the bottom of a window the status line. By default it is always displayed, though it can be turned off. The status line contains information from *Tmux* which can be customized.

[[issue tracker]{.underline}](https://github.com/clarkgrubb/hyperpolyglot/issues) \| content of this page licensed under [[creative commons attribution-sharealike 3.0]{.underline}](http://creativecommons.org/licenses/by-sa/3.0/)
