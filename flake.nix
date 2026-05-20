{
  description = "Per-project devshell flake templates";

  outputs =
    { self }:
    {
      templates = {
        rust = {
          path = ./rust;
          description = "Rust shell";
        };
        python = {
          path = ./python;
          description = "Python shell";
        };
        php = {
          path = ./php;
          description = "PHP shell";
        };
        go = {
          path = ./go;
          description = "Go shell";
        };
        node = {
          path = ./node;
          description = "Node shell";
        };
        deno = {
          path = ./deno;
          description = "Deno shell";
        };
        haskell = {
          path = ./haskell;
          description = "Haskell shell";
        };
      };

      defaultTemplate = self.templates.rust;
    };
}
