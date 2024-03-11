local M = {}

function M.ReloadLSP()
  -- Capture the list of buffers with attached clients
  local buffers = {}
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    for _, buf in ipairs(vim.lsp.get_buffers_by_client_id(client.id)) do
      buffers[buf] = true
    end
    -- Stop the client
    vim.lsp.stop_client(client.id)
  end

  -- Wait a bit for clients to stop
  vim.defer_fn(function()
    -- Trigger LSP start for each buffer that had a client attached
    for buf, _ in pairs(buffers) do
      vim.api.nvim_buf_call(buf, function()
        -- This assumes an autocommand or similar mechanism will restart the LSP
        -- Alternatively, you might directly call any setup functions here
        vim.cmd("e")
      end)
    end
    vim.notify("LSP Reloaded")
  end, 500) -- Adjust delay as needed
end

return M

