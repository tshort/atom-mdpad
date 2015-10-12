url                   = require 'url'
{CompositeDisposable} = require 'atom'

MdpadPreviewView       = require './mdpad-view'

module.exports =
  config:
    htmlBaseName:
      type        : 'string'
      description : 'Base HTML name in the URL'
      default     : 'mdpad.html'

  mdpadPreviewView: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'mdpad:toggle': => @toggle()

    atom.workspace.addOpener (uriToOpen) ->
      try
        {protocol, host, pathname} = url.parse(uriToOpen)
      catch error
        return

      return unless protocol is 'mdpad-preview:'

      try
        pathname = decodeURI(pathname) if pathname
      catch error
        return

      if host is 'editor'
        new MdpadPreviewView(editorId: pathname.substring(1))
      else
        new MdpadPreviewView(filePath: pathname)

  toggle: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?

    uri = "mdpad-preview://editor/#{editor.id}"

    previewPane = atom.workspace.paneForURI(uri)
    if previewPane
      previewPane.destroyItem(previewPane.itemForURI(uri))
      return

    previousActivePane = atom.workspace.getActivePane()
    atom.workspace.open(uri, split: 'right', searchAllPanes: true).done (mdpadPreviewView) ->
      if mdpadPreviewView instanceof MdpadPreviewView
        mdpadPreviewView.renderHTML()
        previousActivePane.activate()

  deactivate: ->
    @subscriptions.dispose()
