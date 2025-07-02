module GUI

using Gtk

include("main_window.jl")
include("dialogs.jl")
include("widgets.jl")

export MainWindow
export show_dialog
export create_custom_widget

end # module
