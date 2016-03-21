# JournalView = require './journal-view'
{CompositeDisposable} = require 'atom'
path = require 'path'
fs = require 'fs'

module.exports = Journal =
  # journalView: null
  # modalPanel: null
  subscriptions: null
  journalFile: null

  activate: (state) ->
    console.log "journal activated"
    # @journalView = new JournalView(state.journalViewState)
    # @modalPanel = atom.workspace.addModalPanel(item: @journalView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'journal:createOrOpen': => @createOrOpen()
    @subscriptions.add atom.commands.add 'atom-workspace', 'journal:newEntry': => @newEntry()
    @journalFile = ''

  deactivate: ->
    # @modalPanel.destroy()
    @subscriptions.dispose()
    # @journalView.destroy()

  serialize: ->
    # journalViewState: @journalView.serialize()

  # toggle: ->
  #   console.log 'Journal was toggled!'
  #
  #   if @modalPanel.isVisible()
  #     @modalPanel.hide()
  #   else
  #     @modalPanel.show()

  createOrOpen: ->
    console.log "journal opened or created"
    @createFileIfNotAlreadyExists()
    @openEditorIfNotAlreadyOpen()

  newEntry: ->
    console.log "new entry called"
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('Hello, World!')

  createFileIfNotAlreadyExists: ->
    journalLoc = atom.project.getPaths()[0]
    # journalLoc = atom.project.getRepositories()[0]?.getWorkingDirectory()
    @journalFile = path.join journalLoc, 'journal.md'
    console.log "create or open called on repo: #{@journalFile}"
    if !fs.existsSync @journalFile
      fs.openSync @journalFile, 'a'
    console.log 'jf: #{@journalFile}'

  openEditorIfNotAlreadyOpen: ->
    open = false
    atom.workspace.getPaneItems().some (paneItem) ->
        console.log paneItem.getURI()?.includes 'journal.md'
        if paneItem?.getURI()?.includes 'journal.md'
          open = true
    if open == false
      atom.workspace.open @journalFile
