ShowInFolder = require '../lib/show-in-folder'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "ShowInFolder", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('show-in-folder')

  describe "when the show-in-folder:active-editor event is triggered", ->
    it "opens the default OS file explorer at the path to the file in the editor", ->
      # TODO prep: save a new file at a known path

      # dispatch
      atom.commands.dispatch workspaceElement, 'show-in-folder:active-editor'

      waitsForPromise ->
        activationPromise

      # TODO: figure out how to test if an external window was opened
      # runs ->
