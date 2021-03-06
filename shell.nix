{ pkgs }: with pkgs;
mkShell {
  buildInputs = [
    figlet
    asciinema
  ];

  shellHook = ''
    local remote_url="$(git config --get remote.origin.url)"
    project_path=$(echo "$remote_url" | sed -E 's"(git@|.+://)[^:/]+[:/](.+)/.+$"\2"')
    repo_name=$(echo "$remote_url" | sed -E -e 's|.+/(.+)$|\1|' -e 's|(.+)(.git)$|\1|')
    figlet -w 120 "Welcome to $project_path's $repo_name"
  '';
}
