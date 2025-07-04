# GovnPorth

GovnPorth is a [Concatenative](https://en.wikipedia.org/wiki/Concatenative_programming_language) [Stack-Oriented](https://en.wikipedia.org/wiki/Stack-oriented_programming) [Programming Language](https://en.wikipedia.org/wiki/Programming_language) for GovnoCore 32-20020

*(If you never heard about this kind of languages before check out [https://concatenative.org/](https://concatenative.org/))*

## Examples

Hello, World:

```porth
proc main in
  "Hello, World\n" puts
end
```

Simple program that prints numbers from 0 to 99 in an ascending order:

```porth
proc main in
  0 while dup 100 < do
    dup print 1 +
  end drop
end
```

## Quick Start

### Bootstrapping

Since GovnPorth is written in Porth you need to compile it using a precompiled fasm program in [./bootstrap/](./bootstrap/).

First you will need to install [fasm](https://flatassembler.net/) and make sure it's available in `$PATH`.

```console
# fasm -m 524288 ./bootstrap/porth-linux-x86_64.fasm
# chmod +x bootstrap/porth-linux-x86_64
# ./bootstrap/porth-linux-x86_64 com porth.porth
# ./porth com govnporth.porth
```

### Compilation

Compilation generates assembly code and compiles it with [fasm](https://flatassembler.net/). So make sure you have it available in your `$PATH`.

```console
$ cat program.gp
proc main in
  34 35 + print
end
$ ./govnporth com program.gp
...
... compilation logs ...
...
$ ./program
69
```

### Testing

Test cases are located in [./tests/](./tests/) folder. The `*.txt` files contain inputs (command line arguments, stdin) and expected outputs (exit code, stdout, stderr) of the corresponding programs.

Run [./test.py](./test.py) script to execute the programs and assert their outputs:

```console
$ ./test.py run
```

To updated expected outputs of the programs run the `update` subcommand:

```console
$ ./test.py update
```

To update expected command line arguments and stdin of a specific program run the `update input <path/to/program.porth>` subcommand:

```console
$ ./test.py update input ./tests/argv.porth new cmd args
[INFO] Provide the stdin for the test case. Press ^D when you are done...
Hello, World
^D
[INFO] Saving input to ./tests/argv.txt
```

The [./examples/](./examples/) folder contains programs that are ment for showcasing the language rather then testing it, but we still can use them for testing just like the stuff in the [./tests/](./tests/) folder:

```console
$ ./test.py run ./examples/
$ ./test.py update input ./examples/name.porth
$ ./test.py update output ./examples/
```

For more info see `./test.py help`

