# JournalView = require './journal-view'
{CompositeDisposable} = require 'atom'
{Point} = require 'atom'
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
    # console.log "new entry called"
    @openEditorIfNotAlreadyOpen()
    if editor = atom.workspace.getActiveTextEditor()
      lastRow = editor.getLastBufferRow()
      editor.setCursorBufferPosition(new Point(lastRow,0))
      editor.moveToEndOfLine()
      editor.insertNewline()
      editor.insertText("** #{new Date().toLocaleString()} **: ")

  createFileIfNotAlreadyExists: ->
    journalLoc = atom.project.getPaths()[0]
    # journalLoc = atom.project.getRepositories()[0]?.getWorkingDirectory()
    @journalFile = path.join journalLoc, 'journal.md'
    console.log "create or open called on repo: #{@journalFile}"
    if !fs.existsSync @journalFile
      fs.openSync @journalFile, 'a'
    console.log 'jf: #{@journalFile}'

  openEditorIfNotAlreadyOpen: ->
    jpane = atom.workspace.paneForURI(@journalFile)
    if jpane == undefined
      atom.workspace.open(@journalFile,{searchAllPanes:true}).then (editor) -> editor.focus()
    else
      jitem = jpane.activateItemForURI(@journalFile)
