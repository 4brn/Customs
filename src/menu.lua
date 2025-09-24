function init_menu()
    menuitem(1, "debug: off", function()
        debug_active = not debug_active
        menuitem(nil, "debug: " .. (debug_active and "on" or "off"))
        return true
    end
    )

end
