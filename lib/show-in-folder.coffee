{CompositeDisposable} = require 'atom'
{shell} = require 'electron'

module.exports = ShowInFolder =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-text-editor', 'show-in-folder:active-editor': =>
      sPath = atom.workspace.getActiveTextEditor().getPath()
      shell.showItemInFolder(sPath)

  deactivate: ->
    @subscriptions.dispose()
