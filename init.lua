-- FZF Popup Plugin - Shows FZF as an overlay in Yazi using tmux popup

return {
  entry = function(_, args)
    local cwd = tostring(cx.active.current.cwd)
    local hidden = args and args[1] == "hidden" or false

    local fd_opts = hidden and "--hidden --exclude .git" or ""

    -- Temporary file to store the result
    local tmp_file = os.tmpname()

    -- Build the command that saves result to temp file
    local fzf_cmd = string.format(
      "fd --type=d --follow %s . '%s' | fzf --border=rounded --prompt='Jump to: ' --preview='eza --tree --level=2 --color=always {}' > %s",
      fd_opts,
      cwd,
      tmp_file
    )

    -- Use tmux popup if available
    local use_tmux = os.getenv("TMUX") ~= nil

    if use_tmux then
      -- Run FZF in tmux popup
      local popup_cmd = string.format(
        "tmux popup -E -w 90%% -h 90%% -x C -y C 'cd %s && %s'",
        cwd,
        fzf_cmd
      )

      os.execute(popup_cmd)
    else
      -- Fallback: run FZF directly
      os.execute("cd " .. cwd .. " && " .. fzf_cmd)
    end

    -- Read the result
    local file = io.open(tmp_file, "r")
    if file then
      local target = file:read("*a")
      file:close()
      os.remove(tmp_file)

      if target and target ~= "" then
        -- Remove trailing newline and navigate
        target = target:gsub("\n$", "")
        ya.manager_emit("cd", { target })
      end
    end
  end,
}
