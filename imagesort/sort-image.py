from gi.repository import GObject, GLib, Gio, Gtk, PeasGtk, Eog
from os import getenv

_MENU_ID = "Sort Image"
_ACTION_NAME = 'sort-image'

class ImageSorterPlugin(GObject.Object, Eog.WindowActivatable,
        PeasGtk.Configurable):
    window = GObject.property(type=Eog.Window)

    def __init__(self):
        GObject.Object.__init__(self)

    def do_activate(self):
        model = self.window.get_gear_menu_section('plugins-section')
        action = Gio.SimpleAction.new(_ACTION_NAME)
        action.connect('activate', self.sort_image_cb, self.window)

        data_home = getenv("XDG_DATA_HOME", getenv("HOME") + "/.local/share")
        self.plugin_dir = data_home + "/eog/plugins"
        self.window.add_action(action)
        menu = Gio.Menu()
        menu.append(_('_Sort'), 'win.' + _ACTION_NAME)
        item = Gio.MenuItem.new_section(None, menu)
        item.set_attribute([('id', 's', _MENU_ID)])
        model.append_item(item)

    def do_deactivate(self):
        menu = self.window.get_gear_menu_section('plugins-section')
        for i in range(0, menu.get_n_items()):
            value = menu.get_item_attribute_value(i, 'id',
                                                  GLib.VariantType.new('s'))

            if value and value.get_string() == _MENU_ID:
                menu.remove(i)
                break

        # Disable accelerator key
        app = Eog.Application.get_instance()
        app.set_accels_for_action('win.' + _ACTION_NAME, ['f', None])

        self.window.remove_action(_ACTION_NAME)

    def sort_image_cb(self, action, parameter, window):
        sort_ui = Gtk.Builder()
        sort_ui_file = self.plugin_dir + "/sort-image.glade"
        sort_ui = sort_ui.new_from_file(sort_ui_file)
        sort_win = sort_ui.get_object("sortImageWindow")
        sort_win.show()

