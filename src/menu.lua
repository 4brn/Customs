function init_menu()
    menuitem(1, "debug: off", function()
        debug_active = not debug_active
        menuitem(nil, "debug: " .. (debug_active and "on" or "off"))
    end
    )
    menuitem(2, "difficulty: ",
      function()
        menuitem(NIL, "difficulty: ")
        return  true
      end
    )
end
