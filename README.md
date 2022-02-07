This repo is for reproduction of the problem described in this thread:

https://www.postgresql.org/message-id/CADofcAV29umxzTFPuJu%2BCvvd5cZKkQxK0TZmpVJenWjok-%3DgYw%40mail.gmail.com

It simulates a badly behaved custom function that results in signals being lost.

To use it:

  1. Edit makefile, set PGHOME appropriately
  2. `sudo make install`
  3. Execute commands in `create.sql`. See comments in that file.
