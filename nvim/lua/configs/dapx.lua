local dap = require("dap")

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

dap.configurations.go = {
	{ type = "delve", name = "Debug Package", request = "launch", program = "${workspaceFolder}" },
	{ type = "delve", name = "Debug File", request = "launch", program = "${file}" },
	{ type = "delve", name = "Debug Test", request = "launch", mode = "test", program = "${file}" },
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
-- require("jdtls").start_or_attach({
-- 	-- The command that starts the language server
-- 	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
-- 	cmd = {
--
-- 		-- 💀
-- 		"java", -- or '/path/to/java17_or_newer/bin/java'
-- 		-- depends on if `java` is in your $PATH env variable and if it points to the right version.
--
-- 		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
-- 		"-Dosgi.bundles.defaultStartLevel=4",
-- 		"-Declipse.product=org.eclipse.jdt.ls.core.product",
-- 		"-Dlog.protocol=true",
-- 		"-Dlog.level=ALL",
-- 		"-Xmx1g",
-- 		"--add-modules=ALL-SYSTEM",
-- 		"--add-opens",
-- 		"java.base/java.util=ALL-UNNAMED",
-- 		"--add-opens",
-- 		"java.base/java.lang=ALL-UNNAMED",
--
-- 		-- 💀
-- 		"-jar",
-- 		"/Users/charlie/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar",
-- 		-- '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
-- 		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
-- 		-- Must point to the                                                     Change this to
-- 		-- eclipse.jdt.ls installation                                           the actual version
--
-- 		-- 💀
-- 		"-configuration",
-- 		"/Users/charlie/.local/share/nvim/mason/packages/jdtls/config_mac",
-- 		-- "/path/to/jdtls_install_location/config_SYSTEM",
-- 		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
-- 		-- Must point to the                      Change to one of `linux`, `win` or `mac`
-- 		-- eclipse.jdt.ls installation            Depending on your system.
--
-- 		-- 💀
-- 		-- See `data directory configuration` section in the README
-- 		"-data",
-- 		-- "/path/to/unique/per/project/workspace/folder",
-- 		"/Users/charlie/.local/share/nvim/jdtlsdata",
-- 	},
--
-- 	-- 💀
-- 	-- This is the default if not provided, you can remove it. Or adjust as needed.
-- 	-- One dedicated LSP server & client will be started per unique root_dir
-- 	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
--
-- 	-- Here you can configure eclipse.jdt.ls specific settings
-- 	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
-- 	-- for a list of options
-- 	settings = {
-- 		java = {},
-- 	},
--
-- 	-- Language server `initializationOptions`
-- 	-- You need to extend the `bundles` with paths to jar files
-- 	-- if you want to use additional eclipse.jdt.ls plugins.
-- 	--
-- 	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
-- 	--
-- 	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
-- 	init_options = {
-- 		bundles = {},
-- 	},
-- })

dap.adapters.java = function(callback)
	-- FIXME:
	-- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
	-- The response to the command must be the `port` used below
	callback({
		type = "server",
		host = "127.0.0.1",
		port = 90000,
	})
end

dap.configurations.java = {
	{
		type = "java",
		request = "attach",
		name = "Debug (Attach) - <100.16.100.129:10029>",
		hostName = "172.16.100.129",
		port = 10029,
	},
}
