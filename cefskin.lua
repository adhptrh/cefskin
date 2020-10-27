local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"function base64_encode(b)return(b:gsub(".",function(c)local d,a="",c:byte()for e=8,1,-1 do d=d..(a%2^e-a%2^(e-1)>0 and"1"or"0")end;return d end).."0000"):gsub("%d%d%d?%d?%d?%d?",function(c)if#c<6 then return""end;local f=0;for e=1,6 do f=f+(c:sub(e,e)=="1"and 2^(6-e)or 0)end;return a:sub(f+1,f+1)end)..({"","==","="})[#b%3+1]end;function base64_decode(b)b=string.gsub(b,"[^"..a.."=]","")return b:gsub(".",function(c)if c=="="then return""end;local d,g="",a:find(c)-1;for e=6,1,-1 do d=d..(g%2^e-g%2^(e-1)>0 and"1"or"0")end;return d end):gsub("%d%d%d?%d?%d?%d?%d?%d?",function(c)if#c~=8 then return""end;local f=0;for e=1,8 do f=f+(c:sub(e,e)=="1"and 2^(8-e)or 0)end;return string.char(f)end)end

fdata = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPEZvcm1EYXRhPgogIDxjZWZza2luIENsYXNzPSJUQ0VGb3JtIiBFbmNvZGluZz0iQXNjaWk4NSI+b200VDgpOlpmdmxjcjlaVUpyeW9WKVk9a0VWT0tGWlE2PUpUM1RJJDVFRjZ7W1l4KXdPWDZ7cGlKNihAbUgoYy1beiNUeTJeeFI7UFNSW1JMcml2PzprSS5yW256TW00RkcjRmVnL3U4R0BXdThJKVF1aUtCLVVmbnlLJDpqaEVRSkBxQmcocnJMQz1lZypiYS0pXlpxOCRiKWZuTkxYcj9fKS1AJCtZelhdal5fci5iWUNyekdaeFVoUkZAWkd2dCRHK0tJRlEjRDVSXXAsQlE4Ki9LKTdTZkVSNlFOa2hdd2h6OSNESXVqUF1GSlRHcjc3dEEwPW9kX14weyh7MHUzOWptTEE1ZTMuVj1KWGNVW28zVjNdMjFxbHA5ITleX2lxaExUOHFaQDt7OHghSy95QD1PXmsoN2IrMEs6OT9Ce2wzSiMyUigkLEBVWEVYKDRdO3BCezNKMl5AMVpueFlqQmIsSE9YRXVseV1PJENebUFaMXZqUztnfW90ZG1yeUBUTnpydnVIO285UlFQfVQ2RDliMUc9QU9KUi9hQ21JMSQoeno/cSNEZls6JDAtNilzSC9GVUpXWS19dltuZGZzTVF7OFgpQUMqQVc0RyxsMFNBcUZjIU1obW9jI18wZU5IUzc1bmpbcnVaUUZBeUNQRkJKSE1NP3QtX19XclQwJC0hPVU4Yj1MQEx6O2p1WGc9MERsNEx2QlBoT0BOdDhNVnlLRF4wXkNBb283N2xaPzF4ZlJbdnM9QVU3Y05vZDctJV1iRTArdW49KUtoL3UpOlk5RVRFTGdhYSN2Yypha1FvXkFjTT9wTHNDfXFsbFs6ekxLcmc/SkAxSnk0ZTlTPyo2YzohaFhbMnJlelUzei9KKzoye2FIWzJZK3ZIR05UWjFTenlpZFdUbC1BK24lY2xtem12UGdIcy8ydnRrUEQoMjJWdi4zPWRdK05IYSNNQDZjIUFkdWo6ZFhfJW1kUnlQOilSVUZfW11RPSRfOF9KJUlxZzlePC9jZWZza2luPgo8L0Zvcm1EYXRhPgo="

local wdt = io.open(os.getenv("temp").."/ceskin.FRM","w")
fdata=base64_decode(fdata)
wdt:write(fdata)
wdt:close()

ceskin =  createFormFromFile(os.getenv("temp").."/ceskin.FRM")
ceskin.show()
skins = {}
skins.id = 0
skins.idd = "d"..tostring(math.random(1,9999))
skins.idd = "d"..tostring(math.random(1,9999))
skins.names = {}
skins.names[0] = "Flat Purple"
skins.names[1] = "Dark Bluish"
skins.names[2] = "Smooth Dark-Blue"

skins.components = {}
skins.formskin = {}

function generateId()
   skins.id = skins.id+1
   return skins.id..skins.idd
end

skins.components[0] = {}
skins.components[0].button = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function pfbutton_down]]..rand..[[(sender, button, x, y)
sender.color = 0xD36F70
sender.font.color = 0xFFFFFF
end

function pfbutton_up]]..rand..[[(sender, button, x, y)
sender.color = 0x1e1e1e
sender.font.color = 0xc0c0c0
end]]
   btnname = "button"..rand
   _ENV[btnname] = createPanel(fn)
   _ENV[btnname].name = btnname
   _ENV[btnname].bevelcolor = 0xD36F70
   _ENV[btnname].Caption = "Button"
   _ENV[btnname].height = 32
   _ENV[btnname].width = 152
   _ENV[btnname].left = fn.width/2 -(_ENV[btnname].width/2)
   _ENV[btnname].top = fn.top/2 -(_ENV[btnname].height/2)
   _ENV[btnname].onmouseup = "pfbutton_up"..rand
   _ENV[btnname].onmousedown = "pfbutton_down"..rand

end
skins.components[0].editbox = function(fn)
   rand = generateId()
   _ENV["editpanel"..rand] = createPanel(fn)
   _ENV["editpanel"..rand].name = "editpanel"..rand
   _ENV["editpanel"..rand].alignment = "taLeftJustify"
   _ENV["editpanel"..rand].caption = "  >"
   _ENV["editpanel"..rand].color = 0x1e1e1e
   _ENV["editpanel"..rand].font.color = 0xffffff
   _ENV["editpanel"..rand].font.name = "Century Gothic"
   _ENV["editpanel"..rand].font.size = 10
   _ENV["editpanel"..rand].bevelcolor = 0xD36F70
   _ENV["editpanel"..rand].height = 24
   _ENV["editpanel"..rand].width = 192
   _ENV["editpanel"..rand].left = fn.width/2 -(_ENV["editpanel"..rand].width/2)
   _ENV["editpanel"..rand].top = fn.top/2 -(_ENV["editpanel"..rand].height/2)

   _ENV["editbox"..rand] = createEdit(fn)
   _ENV["editbox"..rand].name = "editbox"..rand
   _ENV["editbox"..rand].color = 0x1e1e1e
   _ENV["editbox"..rand].font.color = 0xffffff
   _ENV["editbox"..rand].font.name = "Century Gothic"
   _ENV["editbox"..rand].font.size = 10
   _ENV["editbox"..rand].left = 26
   _ENV["editbox"..rand].top = 3
   _ENV["editbox"..rand].height = 17
   _ENV["editbox"..rand].width = 160
   _ENV["editbox"..rand].borderstyle = "bsNone"
   _ENV["editbox"..rand].setParent(_ENV["editpanel"..rand])
   _ENV["editbox"..rand].text = "Editbox"
end
skins.components[0].checkbox = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function cbmousedown]]..rand..[[(sender, button, x, y)
if ]]..fn.name..[[.cbbox]]..rand..[[.wordwrap == false then
   ]]..fn.name..[[.cbbox]]..rand..[[.wordwrap = true
   ]]..fn.name..[[.cbbox]]..rand..[[.color = 0xD36F70
else
   ]]..fn.name..[[.cbbox]]..rand..[[.wordwrap = false
   ]]..fn.name..[[.cbbox]]..rand..[[.color = 0x1e1e1e
end
end]]
   _ENV["cbpanel"..rand] = createPanel(fn)
   _ENV["cbpanel"..rand].name = "cbpanel"..rand
   _ENV["cbpanel"..rand].caption = ""
   _ENV["cbpanel"..rand].alignment = "taLeftJustify"
   _ENV["cbpanel"..rand].bevelcolor = 0x1e1e1e
   _ENV["cbpanel"..rand].color = 0x1e1e1e
   _ENV["cbpanel"..rand].width = 100
   _ENV["cbpanel"..rand].height = 16
   _ENV["cbpanel"..rand].top = fn.top/2 -(_ENV["cbpanel"..rand].height/2)
   _ENV["cbpanel"..rand].left = fn.width/2 -(_ENV["cbpanel"..rand].width/2)

   _ENV["cbbox"..rand] = createPanel(fn)
   _ENV["cbbox"..rand].name = "cbbox"..rand
   _ENV["cbbox"..rand].caption = ""
   _ENV["cbbox"..rand].height = 16
   _ENV["cbbox"..rand].width = 16
   _ENV["cbbox"..rand].top = 0
   _ENV["cbbox"..rand].left = 0
   _ENV["cbbox"..rand].bevelcolor = 0xD36F70
   _ENV["cbbox"..rand].setParent(_ENV["cbpanel"..rand])
   _ENV["cbbox"..rand].onmousedown = "cbmousedown"..rand

   _ENV["cblabel"..rand] = createLabel(fn)
   _ENV["cblabel"..rand].left = 16 + 8
   _ENV["cblabel"..rand].top = 0
   _ENV["cblabel"..rand].name = "cblabel"..rand
   _ENV["cblabel"..rand].caption = "Checkbox"
   _ENV["cblabel"..rand].setParent(_ENV["cbpanel"..rand])
   _ENV["cblabel"..rand].onmousedown = "cbmousedown"..rand
end
skins.components[0].listbox = function(fn)
   rand = generateId()
   _ENV["lbpanel"..rand] = createPanel(fn)
   _ENV["lbpanel"..rand].name = "lbpanel"..rand
   _ENV["lbpanel"..rand].caption = ""
   _ENV["lbpanel"..rand].bevelcolor = 0xD36F70
   _ENV["lbpanel"..rand].color = 0x1e1e1e
   _ENV["lbpanel"..rand].height = 144
   _ENV["lbpanel"..rand].width = 224
   _ENV["lbpanel"..rand].left = fn.width/2 - (_ENV["lbpanel"..rand].width/2)
   _ENV["lbpanel"..rand].top = fn.height/2 - (_ENV["lbpanel"..rand].height/2)

   _ENV["lbox"..rand] = createListBox(fn)
   _ENV["lbox"..rand].name = "lbox"..rand
   _ENV["lbox"..rand].left = 1
   _ENV["lbox"..rand].top = 1
   _ENV["lbox"..rand].width = _ENV["lbpanel"..rand].width-2
   _ENV["lbox"..rand].height = _ENV["lbpanel"..rand].height-2
   _ENV["lbox"..rand].color = 0x1e1e1e
   _ENV["lbox"..rand].borderstyle = "bsNone"
   _ENV["lbox"..rand].setParent(_ENV["lbpanel"..rand])
end
skins.components[0].memo = function(fn)
   rand = generateId()
   _ENV["memopanel"..rand] = createPanel(fn)
   _ENV["memopanel"..rand].name = "memopanel"..rand
   _ENV["memopanel"..rand].caption = ""
   _ENV["memopanel"..rand].bevelcolor = 0xD36F70
   _ENV["memopanel"..rand].color = 0x1e1e1e
   _ENV["memopanel"..rand].height = 144
   _ENV["memopanel"..rand].width = 224
   _ENV["memopanel"..rand].left = fn.width/2 - (_ENV["memopanel"..rand].width/2)
   _ENV["memopanel"..rand].top = fn.height/2 - (_ENV["memopanel"..rand].height/2)

   _ENV["memob"..rand] = createMemo(fn)
   _ENV["memob"..rand].name = "memob"..rand
   _ENV["memob"..rand].lines.text = "Memo"
   _ENV["memob"..rand].left = 1
   _ENV["memob"..rand].top = 1
   _ENV["memob"..rand].width = _ENV["memopanel"..rand].width-2
   _ENV["memob"..rand].height = _ENV["memopanel"..rand].height-2
   _ENV["memob"..rand].color = 0x1e1e1e
   _ENV["memob"..rand].borderstyle = "bsNone"
   _ENV["memob"..rand].setParent(_ENV["memopanel"..rand])
end

skins.formskin[0] = function(fn)
   rand = generateId()

   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function formdrag]]..rand..[[()
]]..fn.name..[[.dragNow()
end

function closeform]]..rand..[[()
os.exit()
end]]

   fn.alphablend = true
   fn.alphablendvalue = 250
   fn.borderstyle = "bsNone"
   fn.color = 0x1e1e1f
   fn.font.color = 0xc0c0c0
   fn.font.name = "Century Gothic"
   fn.font.size = 10

   _ENV["bodyfn"..rand] = createPanel(fn)
   _ENV["bodyfn"..rand].name = "body"
   _ENV["bodyfn"..rand].caption = ""
   _ENV["bodyfn"..rand].bevelcolor = 0xD36F70
   _ENV["bodyfn"..rand].color = 0x1e1e1e
   _ENV["bodyfn"..rand].left = 0
   _ENV["bodyfn"..rand].top = 0
   _ENV["bodyfn"..rand].height = fn.height
   _ENV["bodyfn"..rand].width = fn.width

   _ENV["titlefn"..rand] = createPanel(fn)
   _ENV["titlefn"..rand].name = "title"
   _ENV["titlefn"..rand].top = 1
   _ENV["titlefn"..rand].left = 1
   _ENV["titlefn"..rand].alignment = "taLeftJustify"
   _ENV["titlefn"..rand].bevelouter = "bvNone"
   _ENV["titlefn"..rand].caption = "  "..fn.Caption
   _ENV["titlefn"..rand].color = 0x232323
   _ENV["titlefn"..rand].font.color = 0xd1d1d1
   _ENV["titlefn"..rand].font.style = "fsBold"
   _ENV["titlefn"..rand].height = 30
   _ENV["titlefn"..rand].width = _ENV["bodyfn"..rand].width-2
   _ENV["titlefn"..rand].setParent(_ENV["bodyfn"..rand])
   _ENV["titlefn"..rand].onmousedown = "formdrag"..rand

   _ENV["closefn"..rand] = createPanel(fn)
   _ENV["closefn"..rand].name = "closebutton"
   _ENV["closefn"..rand].caption = ""
   _ENV["closefn"..rand].height = 15
   _ENV["closefn"..rand].width = 15
   _ENV["closefn"..rand].bevelouter = "bvNone"
   _ENV["closefn"..rand].color = 0x5252ff
   _ENV["closefn"..rand].font.color = 0xffffff
   _ENV["closefn"..rand].top = 8
   _ENV["closefn"..rand].left = _ENV["titlefn"..rand].width - _ENV["closefn"..rand].width - 7
   _ENV["closefn"..rand].setParent(_ENV["titlefn"..rand])
   _ENV["closefn"..rand].onclick = "closeform"..rand

end

skins.components[1] = {}
skins.components[1].button = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function btndb_mousedown]]..rand..[[(sender,button,x,y)
sender.color = 0x3D3129
end

function btndb_mouseup]]..rand..[[(sender,button,x,y)
sender.color = 0x4D3D33
end

function btndb_mouseenter]]..rand..[[(sender)
sender.color = 0x58463A
end

function btndb_mouseleave]]..rand..[[(sender)
sender.color = 0x4D3D33
end]]
   _ENV["buttondb"..rand] = createPanel(fn)
   _ENV["buttondb"..rand].name = "buttondb"..rand
   _ENV["buttondb"..rand].bevelcolor = 0x7C6452
   _ENV["buttondb"..rand].caption = "Button"
   _ENV["buttondb"..rand].color = 0x4D3D33
   _ENV["buttondb"..rand].height = 42
   _ENV["buttondb"..rand].width = 138
   _ENV["buttondb"..rand].left = fn.width/2 - (_ENV["buttondb"..rand].width/2)
   _ENV["buttondb"..rand].top = fn.height/2 - (_ENV["buttondb"..rand].height/2)
   _ENV["buttondb"..rand].onmousedown = "btndb_mousedown"..rand
   _ENV["buttondb"..rand].onmouseup = "btndb_mouseup"..rand
   _ENV["buttondb"..rand].onmouseenter = "btndb_mouseenter"..rand
   _ENV["buttondb"..rand].onmouseleave = "btndb_mouseleave"..rand
end
skins.components[1].editbox = function(fn)
   rand = generateId()
   _ENV["editpaneldb"..rand] = createPanel(fn)
   _ENV["editpaneldb"..rand].name = "editpaneldb"..rand
   _ENV["editpaneldb"..rand].color = 0x322921
   _ENV["editpaneldb"..rand].font.size = 10
   _ENV["editpaneldb"..rand].bevelcolor = 0x7C6452
   _ENV["editpaneldb"..rand].height = 24
   _ENV["editpaneldb"..rand].width = 192
   _ENV["editpaneldb"..rand].left = fn.width/2 -(_ENV["editpaneldb"..rand].width/2)
   _ENV["editpaneldb"..rand].top = fn.height/2 -(_ENV["editpaneldb"..rand].height/2)

   _ENV["editboxdb"..rand] = createEdit(fn)
   _ENV["editboxdb"..rand].name = "editboxdb"..rand
   _ENV["editboxdb"..rand].color = 0x322921
   _ENV["editboxdb"..rand].font.size = 10
   _ENV["editboxdb"..rand].left = 6
   _ENV["editboxdb"..rand].top = 3
   _ENV["editboxdb"..rand].height = 17
   _ENV["editboxdb"..rand].width = 182
   _ENV["editboxdb"..rand].borderstyle = "bsNone"
   _ENV["editboxdb"..rand].setParent(_ENV["editpaneldb"..rand])
   _ENV["editboxdb"..rand].text = "Editbox"

end
skins.components[1].checkbox = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function cbmousedowndb]]..rand..[[(sender, button, x, y)
if ]]..fn.name..[[.cbboxdb]]..rand..[[.wordwrap == false then
   ]]..fn.name..[[.cbboxdb]]..rand..[[.wordwrap = true
   ]]..fn.name..[[.cbboxdb]]..rand..[[.color = 0x58453A
else
   ]]..fn.name..[[.cbboxdb]]..rand..[[.wordwrap = false
   ]]..fn.name..[[.cbboxdb]]..rand..[[.color = 0x312620
end
end]]
   _ENV["cbpaneldb"..rand] = createPanel(fn)
   _ENV["cbpaneldb"..rand].name = "cbpaneldb"..rand
   _ENV["cbpaneldb"..rand].caption = ""
   _ENV["cbpaneldb"..rand].alignment = "taLeftJustify"
   _ENV["cbpaneldb"..rand].bevelcolor = 0x382C25
   _ENV["cbpaneldb"..rand].color = 0x382C25
   _ENV["cbpaneldb"..rand].width = 100
   _ENV["cbpaneldb"..rand].height = 16
   _ENV["cbpaneldb"..rand].top = fn.top/2 -(_ENV["cbpaneldb"..rand].height/2)
   _ENV["cbpaneldb"..rand].left = fn.width/2 -(_ENV["cbpaneldb"..rand].width/2)

   _ENV["cbboxdb"..rand] = createPanel(fn)
   _ENV["cbboxdb"..rand].name = "cbboxdb"..rand
   _ENV["cbboxdb"..rand].caption = ""
   _ENV["cbboxdb"..rand].height = 16
   _ENV["cbboxdb"..rand].width = 16
   _ENV["cbboxdb"..rand].top = 0
   _ENV["cbboxdb"..rand].left = 0
   _ENV["cbboxdb"..rand].bevelcolor = 0x7C6452
   _ENV["cbboxdb"..rand].setParent(_ENV["cbpaneldb"..rand])
   _ENV["cbboxdb"..rand].onmousedown = "cbmousedowndb"..rand

   _ENV["cblabeldb"..rand] = createLabel(fn)
   _ENV["cblabeldb"..rand].left = 20 + _ENV["cblabeldb"..rand].width
   _ENV["cblabeldb"..rand].top = -1
   _ENV["cblabeldb"..rand].name = "cblabeldb"..rand
   _ENV["cblabeldb"..rand].caption = "Checkbox"
   _ENV["cblabeldb"..rand].setParent(_ENV["cbpaneldb"..rand])
   _ENV["cblabeldb"..rand].onmousedown = "cbmousedowndb"..rand

end
skins.components[1].listbox = function(fn)
   rand = generateId()
   _ENV["lbpaneldb"..rand] = createPanel(fn)
   _ENV["lbpaneldb"..rand].name = "lbpaneldb"..rand
   _ENV["lbpaneldb"..rand].caption = ""
   _ENV["lbpaneldb"..rand].bevelcolor = 0x7C6452
   _ENV["lbpaneldb"..rand].color = 0x382C25
   _ENV["lbpaneldb"..rand].height = 144
   _ENV["lbpaneldb"..rand].width = 224
   _ENV["lbpaneldb"..rand].left = fn.width/2 - (_ENV["lbpaneldb"..rand].width/2)
   _ENV["lbpaneldb"..rand].top = fn.height/2 - (_ENV["lbpaneldb"..rand].height/2)

   _ENV["lboxdb"..rand] = createListBox(fn)
   _ENV["lboxdb"..rand].name = "lboxdb"..rand
   _ENV["lboxdb"..rand].left = 1
   _ENV["lboxdb"..rand].top = 1
   _ENV["lboxdb"..rand].width = _ENV["lbpaneldb"..rand].width-2
   _ENV["lboxdb"..rand].height = _ENV["lbpaneldb"..rand].height-2
   _ENV["lboxdb"..rand].color = 0x312620
   _ENV["lboxdb"..rand].borderstyle = "bsNone"
   _ENV["lboxdb"..rand].setParent(_ENV["lbpaneldb"..rand])
end
skins.components[1].memo = function(fn)
   rand = generateId()
   _ENV["memopaneldb"..rand] = createPanel(fn)
   _ENV["memopaneldb"..rand].name = "memopaneldb"..rand
   _ENV["memopaneldb"..rand].caption = ""
   _ENV["memopaneldb"..rand].bevelcolor = 0x7C6452
   _ENV["memopaneldb"..rand].color = 0x382C25
   _ENV["memopaneldb"..rand].height = 144
   _ENV["memopaneldb"..rand].width = 224
   _ENV["memopaneldb"..rand].left = fn.width/2 - (_ENV["memopaneldb"..rand].width/2)
   _ENV["memopaneldb"..rand].top = fn.height/2 - (_ENV["memopaneldb"..rand].height/2)

   _ENV["memodb"..rand] = createMemo(fn)
   _ENV["memodb"..rand].name = "memodb"..rand
   _ENV["memodb"..rand].lines.text = "Memo"
   _ENV["memodb"..rand].left = 1
   _ENV["memodb"..rand].top = 1
   _ENV["memodb"..rand].width = _ENV["memopaneldb"..rand].width-2
   _ENV["memodb"..rand].height = _ENV["memopaneldb"..rand].height-2
   _ENV["memodb"..rand].color = 0x312620
   _ENV["memodb"..rand].borderstyle = "bsNone"
   _ENV["memodb"..rand].setParent(_ENV["memopaneldb"..rand])
end

skins.formskin[1] = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function formdrag]]..rand..[[()
]]..fn.name..[[.dragNow()
end

function closeform]]..rand..[[()
os.exit()
end]]


   fn.borderstyle = "bsNone"
   fn.name = fn.name
   fn.color = 0x261e1a
   fn.font.color = 0xc0c0c0
   fn.font.name = "Segoe UI"
   fn.font.size = 10
   fn.font.style = "fsBold"

   _ENV["body"..rand] = createPanel(fn)
   _ENV["body"..rand].name = "body"..rand
   _ENV["body"..rand].caption = ""
   _ENV["body"..rand].left = 1
   _ENV["body"..rand].top = 1
   _ENV["body"..rand].width = fn.width-2
   _ENV["body"..rand].height = fn.height-2
   _ENV["body"..rand].color = 0x382C25
   _ENV["body"..rand].bevelouter = "bvNone"
   _ENV["body"..rand].onmousedown = "formdrag"..rand

   _ENV["bst"..rand] = createPanel(fn)
   _ENV["bst"..rand].name = "bst"..rand
   _ENV["bst"..rand].caption = ""
   _ENV["bst"..rand].bevelouter = "bvNone"
   _ENV["bst"..rand].color = 0xA48775
   _ENV["bst"..rand].height = 14
   _ENV["bst"..rand].width = 2
   _ENV["bst"..rand].top = 10
   _ENV["bst"..rand].left = 10
   _ENV["bst"..rand].setParent(_ENV["body"..rand])

   _ENV["bst1"..rand] = createPanel(fn)
   _ENV["bst1"..rand].name = "bst1"..rand
   _ENV["bst1"..rand].caption = ""
   _ENV["bst1"..rand].bevelouter = "bvNone"
   _ENV["bst1"..rand].color = 0xC1AC9F
   _ENV["bst1"..rand].height = 14
   _ENV["bst1"..rand].width = 2
   _ENV["bst1"..rand].top = 10
   _ENV["bst1"..rand].left = 15
   _ENV["bst1"..rand].setParent(_ENV["body"..rand])

   _ENV["title"..rand] = createLabel(fn)
   _ENV["title"..rand].name = "title"..rand
   _ENV["title"..rand].caption = fn.caption
   _ENV["title"..rand].font.color = 0xEBEBEB
   _ENV["title"..rand].left = 23
   _ENV["title"..rand].top = 8
   _ENV["title"..rand].setParent(_ENV["body"..rand])
   _ENV["title"..rand].onmousedown = "formdrag"..rand

   _ENV["close"..rand] = createLabel(fn)
   _ENV["close"..rand].name = "close"..rand
   _ENV["close"..rand].caption = "X"
   _ENV["close"..rand].font.color = 0x5B5BFF
   _ENV["close"..rand].left = _ENV["body"..rand].width - _ENV["close"..rand].width - 10
   _ENV["close"..rand].top = 8
   _ENV["close"..rand].onclick = "closeform"..rand
   _ENV["close"..rand].setParent(_ENV["body"..rand])

end

skins.components[2] = {}
skins.components[2].button = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function btnsdb_mousedown]]..rand..[[(sender,button,x,y)
         gotoColor1(sender,{113,140,236},20)
         sender.font.color = "0x"..rgbToHex({113,140,236})
end

function btnsdb_mouseup]]..rand..[[(sender,button,x,y)
         gotoColor1(sender,{15,15,15},20)
         sender.font.color = "0x"..rgbToHex({192,192,192})
end]]

   _ENV["buttonsdb"..rand] = createPanel(fn)
   _ENV["buttonsdb"..rand].name = "buttonsdb"..rand
   _ENV["buttonsdb"..rand].bevelcolor = 0x0F0f0f
   _ENV["buttonsdb"..rand].caption = "Button"
   _ENV["buttonsdb"..rand].color = 0x191919
   _ENV["buttonsdb"..rand].height = 40
   _ENV["buttonsdb"..rand].width = 132
   _ENV["buttonsdb"..rand].left = fn.width/2 - (_ENV["buttonsdb"..rand].width/2)
   _ENV["buttonsdb"..rand].top = fn.height/2 - (_ENV["buttonsdb"..rand].height/2)
   _ENV["buttonsdb"..rand].onmousedown = "btnsdb_mousedown"..rand
   _ENV["buttonsdb"..rand].onmouseup = "btnsdb_mouseup"..rand
end
skins.components[2].editbox = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function ceeditsdb_enter]]..rand..[[(sender)
         gotoColor1(]]..fn.name..[[.editpanelsdb]]..rand..[[,{113,140,236},15)
end

function ceeditsdb_exit]]..rand..[[(sender)
         gotoColor1(]]..fn.name..[[.editpanelsdb]]..rand..[[,{15,15,15},15)
end]]
   _ENV["editpanelsdb"..rand] = createPanel(fn)
   _ENV["editpanelsdb"..rand].name = "editpanelsdb"..rand
   _ENV["editpanelsdb"..rand].color = 0x191919
   _ENV["editpanelsdb"..rand].bevelcolor = 0x0f0f0f
   _ENV["editpanelsdb"..rand].height = 26
   _ENV["editpanelsdb"..rand].width = 178
   _ENV["editpanelsdb"..rand].left = fn.width/2 -(_ENV["editpanelsdb"..rand].width/2)
   _ENV["editpanelsdb"..rand].top = fn.height/2 -(_ENV["editpanelsdb"..rand].height/2)

   _ENV["editboxsdb"..rand] = createEdit(fn)
   _ENV["editboxsdb"..rand].name = "editboxsdb"..rand
   _ENV["editboxsdb"..rand].color = 0x191919
   _ENV["editboxsdb"..rand].font.name = "Calibri"
   _ENV["editboxsdb"..rand].left = 4
   _ENV["editboxsdb"..rand].top = 3
   _ENV["editboxsdb"..rand].height = 19
   _ENV["editboxsdb"..rand].width = 168
   _ENV["editboxsdb"..rand].borderstyle = "bsNone"
   _ENV["editboxsdb"..rand].onenter = "ceeditsdb_enter"..rand
   _ENV["editboxsdb"..rand].onexit = "ceeditsdb_exit"..rand
   _ENV["editboxsdb"..rand].setParent(_ENV["editpanelsdb"..rand])
   _ENV["editboxsdb"..rand].text = "Editbox"
end
skins.components[2].checkbox = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function cbmousedownsdb]]..rand..[[(sender, button, x, y)
         if ]]..fn.name..".cbboxsdb"..rand..[[.wordwrap == false then
            ]]..fn.name..".cbboxsdb"..rand..[[.wordwrap = true
            gotoColor2(]]..fn.name..".cbboxsdb"..rand..[[,{113,140,236},20)
         else
            ]]..fn.name..".cbboxsdb"..rand..[[.wordwrap = false
            gotoColor2(]]..fn.name..".cbboxsdb"..rand..[[,{30,30,30},20)
         end
end]]

   _ENV["cbpanelsdb"..rand] = createPanel(fn)
   _ENV["cbpanelsdb"..rand].name = "cbpanelsdb"..rand
   _ENV["cbpanelsdb"..rand].caption = ""
   _ENV["cbpanelsdb"..rand].alignment = "taLeftJustify"
   _ENV["cbpanelsdb"..rand].bevelouter = "bvNone"
   _ENV["cbpanelsdb"..rand].color = 0x1e1e1e
   _ENV["cbpanelsdb"..rand].width = 122
   _ENV["cbpanelsdb"..rand].height = 15
   _ENV["cbpanelsdb"..rand].top = fn.top/2 -(_ENV["cbpanelsdb"..rand].height/2)
   _ENV["cbpanelsdb"..rand].left = fn.width/2 -(_ENV["cbpanelsdb"..rand].width/2)

   _ENV["cbboxsdb"..rand] = createPanel(fn)
   _ENV["cbboxsdb"..rand].name = "cbboxsdb"..rand
   _ENV["cbboxsdb"..rand].caption = ""
   _ENV["cbboxsdb"..rand].height = 15
   _ENV["cbboxsdb"..rand].width = 15
   _ENV["cbboxsdb"..rand].top = 0
   _ENV["cbboxsdb"..rand].color = 0x1e1e1e
   _ENV["cbboxsdb"..rand].left = 0
   _ENV["cbboxsdb"..rand].bevelcolor = 0x0f0f0f
   _ENV["cbboxsdb"..rand].setParent(_ENV["cbpanelsdb"..rand])
   _ENV["cbboxsdb"..rand].onmousedown = "cbmousedownsdb"..rand

   _ENV["cblabelsdb"..rand] = createLabel(fn)
   _ENV["cblabelsdb"..rand].left = 20 + _ENV["cblabelsdb"..rand].width
   _ENV["cblabelsdb"..rand].top = -3
   _ENV["cblabelsdb"..rand].name = "cblabelsdb"..rand
   _ENV["cblabelsdb"..rand].caption = "Checkbox"
   _ENV["cblabelsdb"..rand].setParent(_ENV["cbpanelsdb"..rand])
   _ENV["cblabelsdb"..rand].onmousedown = "cbmousedownsdb"..rand
end
skins.components[2].listbox = function(fn)
   rand = generateId()
      MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function enterlbsdb]]..rand..[[()
         gotoColor1(]]..fn.name..[[.lbpanelsdb]]..rand..[[,{113,140,236},15)
end
function exitlbsdb]]..rand..[[()
         gotoColor1(]]..fn.name..[[.lbpanelsdb]]..rand..[[,{15,15,15},15)
end]]
   _ENV["lbpanelsdb"..rand] = createPanel(fn)
   _ENV["lbpanelsdb"..rand].name = "lbpanelsdb"..rand
   _ENV["lbpanelsdb"..rand].caption = ""
   _ENV["lbpanelsdb"..rand].bevelcolor = 0x0f0f0f
   _ENV["lbpanelsdb"..rand].color = 0x191919
   _ENV["lbpanelsdb"..rand].height = 144
   _ENV["lbpanelsdb"..rand].width = 224
   _ENV["lbpanelsdb"..rand].left = fn.width/2 - (_ENV["lbpanelsdb"..rand].width/2)
   _ENV["lbpanelsdb"..rand].top = fn.height/2 - (_ENV["lbpanelsdb"..rand].height/2)

   _ENV["lboxsdb"..rand] = createListBox(fn)
   _ENV["lboxsdb"..rand].name = "lboxsdb"..rand
   _ENV["lboxsdb"..rand].onenter = "enterlbsdb"..rand
   _ENV["lboxsdb"..rand].onexit = "exitlbsdb"..rand
   _ENV["lboxsdb"..rand].left = 1
   _ENV["lboxsdb"..rand].top = 1
   _ENV["lboxsdb"..rand].width = _ENV["lbpanelsdb"..rand].width-2
   _ENV["lboxsdb"..rand].height = _ENV["lbpanelsdb"..rand].height-2
   _ENV["lboxsdb"..rand].color = 0x191919
   _ENV["lboxsdb"..rand].borderstyle = "bsNone"
   _ENV["lboxsdb"..rand].setParent(_ENV["lbpanelsdb"..rand])
end
skins.components[2].memo = function(fn)
   rand = generateId()
         MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function entermemosdb]]..rand..[[()
         gotoColor1(]]..fn.name..[[.memopanelsdb]]..rand..[[,{113,140,236},15)
end
function exitmemosdb]]..rand..[[()
         gotoColor1(]]..fn.name..[[.memopanelsdb]]..rand..[[,{15,15,15},15)
end]]
   _ENV["memopanelsdb"..rand] = createPanel(fn)
   _ENV["memopanelsdb"..rand].name = "memopanelsdb"..rand
   _ENV["memopanelsdb"..rand].caption = ""
   _ENV["memopanelsdb"..rand].bevelcolor = 0x0f0f0f
   _ENV["memopanelsdb"..rand].color = 0x191919
   _ENV["memopanelsdb"..rand].height = 144
   _ENV["memopanelsdb"..rand].width = 224
   _ENV["memopanelsdb"..rand].left = fn.width/2 - (_ENV["memopanelsdb"..rand].width/2)
   _ENV["memopanelsdb"..rand].top = fn.height/2 - (_ENV["memopanelsdb"..rand].height/2)

   _ENV["memosdb"..rand] = createMemo(fn)
   _ENV["memosdb"..rand].name = "memosdb"..rand
   _ENV["memosdb"..rand].lines.text = "Memo"
   _ENV["memosdb"..rand].onenter = "entermemosdb"..rand
   _ENV["memosdb"..rand].onexit = "exitmemosdb"..rand
   _ENV["memosdb"..rand].left = 1
   _ENV["memosdb"..rand].top = 1
   _ENV["memosdb"..rand].width = _ENV["memopanelsdb"..rand].width-2
   _ENV["memosdb"..rand].height = _ENV["memopanelsdb"..rand].height-2
   _ENV["memosdb"..rand].color = 0x191919
   _ENV["memosdb"..rand].borderstyle = "bsNone"
   _ENV["memosdb"..rand].setParent(_ENV["memopanelsdb"..rand])
end
skins.components[2].pagecontrol = function(fn)
   rand = generateId()
            MainForm.frmAutoInject.assemblescreen.lines.text =MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[function pgmenu1sdb_mdown]]..rand..[[(sender, button, x, y)
         ]]..fn.name..[[.pgmenu1sdb]]..rand..[[.color = 0xEC8C71
         ]]..fn.name..[[.pgmenu1sdb]]..rand..[[.font.color = 0xFFFFFF
         ]]..fn.name..[[.pgmenu2sdb]]..rand..[[.color = 0x282828
         ]]..fn.name..[[.pgmenu2sdb]]..rand..[[.font.color = 0xC0C0C0
         ]]..fn.name..[[.pgmenu3sdb]]..rand..[[.color = 0x282828
         ]]..fn.name..[[.pgmenu3sdb]]..rand..[[.font.color = 0xC0C0C0
         ]]..fn.name..[[.pg1sdb]]..rand..[[.bringToFront()
end
function pgmenu2sdb_mdown]]..rand..[[(sender, button, x, y)
         ]]..fn.name..[[.pgmenu2sdb]]..rand..[[.color = 0xEC8C71
         ]]..fn.name..[[.pgmenu2sdb]]..rand..[[.font.color = 0xFFFFFF
         ]]..fn.name..[[.pgmenu1sdb]]..rand..[[.color = 0x282828
         ]]..fn.name..[[.pgmenu1sdb]]..rand..[[.font.color = 0xC0C0C0
         ]]..fn.name..[[.pgmenu3sdb]]..rand..[[.color = 0x282828
         ]]..fn.name..[[.pgmenu3sdb]]..rand..[[.font.color = 0xC0C0C0
         ]]..fn.name..[[.pg2sdb]]..rand..[[.bringToFront()
end
function pgmenu3sdb_mdown]]..rand..[[(sender, button, x, y)
         ]]..fn.name..[[.pgmenu3sdb]]..rand..[[.color = 0xEC8C71
         ]]..fn.name..[[.pgmenu3sdb]]..rand..[[.font.color = 0xFFFFFF
         ]]..fn.name..[[.pgmenu1sdb]]..rand..[[.color = 0x282828
         ]]..fn.name..[[.pgmenu1sdb]]..rand..[[.font.color = 0xC0C0C0
         ]]..fn.name..[[.pgmenu2sdb]]..rand..[[.color = 0x282828
         ]]..fn.name..[[.pgmenu2sdb]]..rand..[[.font.color = 0xC0C0C0
         ]]..fn.name..[[.pg3sdb]]..rand..[[.bringToFront()
end]]
   _ENV["pgbodysdb"..rand] = createPanel(fn)
   _ENV["pgbodysdb"..rand].name = "pgbodysdb"..rand
   _ENV["pgbodysdb"..rand].caption = ""
   _ENV["pgbodysdb"..rand].bevelouter = "bvNone"
   _ENV["pgbodysdb"..rand].color = 0x1e1e1e
   _ENV["pgbodysdb"..rand].height = 292
   _ENV["pgbodysdb"..rand].width = 552

   _ENV["pgmenu1sdb"..rand] = createPanel(fn)
   _ENV["pgmenu1sdb"..rand].name = "pgmenu1sdb"..rand
   _ENV["pgmenu1sdb"..rand].caption = "Page 1"
   _ENV["pgmenu1sdb"..rand].color = 0xec8c71
   _ENV["pgmenu1sdb"..rand].height = 34
   _ENV["pgmenu1sdb"..rand].bevelouter = "bvNone"
   _ENV["pgmenu1sdb"..rand].left = 4
   _ENV["pgmenu1sdb"..rand].top = 0
   _ENV["pgmenu1sdb"..rand].width = 110
   _ENV["pgmenu1sdb"..rand].onmousedown = "pgmenu1sdb_mdown"..rand
   _ENV["pgmenu1sdb"..rand].font.color = 0xffffff
   _ENV["pgmenu1sdb"..rand].setParent(_ENV["pgbodysdb"..rand])

   _ENV["pgmenu2sdb"..rand] = createPanel(fn)
   _ENV["pgmenu2sdb"..rand].name = "pgmenu2sdb"..rand
   _ENV["pgmenu2sdb"..rand].caption = "Page 2"
   _ENV["pgmenu2sdb"..rand].color = 0x282828
   _ENV["pgmenu2sdb"..rand].bevelouter = "bvNone"
   _ENV["pgmenu2sdb"..rand].font.color = 0xc0c0c0
   _ENV["pgmenu2sdb"..rand].height = 34
   _ENV["pgmenu2sdb"..rand].left = 4+110
   _ENV["pgmenu2sdb"..rand].top = 0
   _ENV["pgmenu2sdb"..rand].width = 110
   _ENV["pgmenu2sdb"..rand].onmousedown = "pgmenu2sdb_mdown"..rand
   _ENV["pgmenu2sdb"..rand].setParent(_ENV["pgbodysdb"..rand])

   _ENV["pgmenu3sdb"..rand] = createPanel(fn)
   _ENV["pgmenu3sdb"..rand].name = "pgmenu3sdb"..rand
   _ENV["pgmenu3sdb"..rand].caption = "Page 3"
   _ENV["pgmenu3sdb"..rand].bevelouter = "bvNone"
   _ENV["pgmenu3sdb"..rand].color = 0x282828
   _ENV["pgmenu3sdb"..rand].font.color = 0xc0c0c0
   _ENV["pgmenu3sdb"..rand].height = 34
   _ENV["pgmenu3sdb"..rand].left = 4+110+110
   _ENV["pgmenu3sdb"..rand].top = 0
   _ENV["pgmenu3sdb"..rand].width = 110
   _ENV["pgmenu3sdb"..rand].onmousedown = "pgmenu3sdb_mdown"..rand
   _ENV["pgmenu3sdb"..rand].setParent(_ENV["pgbodysdb"..rand])

   _ENV["pg2sdb"..rand] = createPanel(fn)
   _ENV["pg2sdb"..rand].name = "pg2sdb"..rand
   _ENV["pg2sdb"..rand].caption = "Page 2"
   _ENV["pg2sdb"..rand].bevelcolor = 0xec8c71
   _ENV["pg2sdb"..rand].height = 258
   _ENV["pg2sdb"..rand].font.color = 0xc0c0c0
   _ENV["pg2sdb"..rand].left = 0
   _ENV["pg2sdb"..rand].top = 34
   _ENV["pg2sdb"..rand].width = 552
   _ENV["pg2sdb"..rand].setParent(_ENV["pgbodysdb"..rand])

   _ENV["pg3sdb"..rand] = createPanel(fn)
   _ENV["pg3sdb"..rand].name = "pg3sdb"..rand
   _ENV["pg3sdb"..rand].caption = "Page 3"
   _ENV["pg3sdb"..rand].bevelcolor = 0xec8c71
   _ENV["pg3sdb"..rand].height = 258
   _ENV["pg3sdb"..rand].font.color = 0xc0c0c0
   _ENV["pg3sdb"..rand].left = 0
   _ENV["pg3sdb"..rand].top = 34
   _ENV["pg3sdb"..rand].width = 552
   _ENV["pg3sdb"..rand].setParent(_ENV["pgbodysdb"..rand])

   _ENV["pg1sdb"..rand] = createPanel(fn)
   _ENV["pg1sdb"..rand].name = "pg1sdb"..rand
   _ENV["pg1sdb"..rand].caption = "Page 1"
   _ENV["pg1sdb"..rand].bevelcolor = 0xec8c71
   _ENV["pg1sdb"..rand].height = 258
   _ENV["pg1sdb"..rand].font.color = 0xc0c0c0
   _ENV["pg1sdb"..rand].left = 0
   _ENV["pg1sdb"..rand].top = 34
   _ENV["pg1sdb"..rand].width = 552
   _ENV["pg1sdb"..rand].setParent(_ENV["pgbodysdb"..rand])
end

skins.formskin[2] = function(fn)
   rand = generateId()
   MainForm.frmAutoInject.assemblescreen.lines.text = MainForm.frmAutoInject.assemblescreen.lines.text .. "\n" ..
[[
function hexToRGB(hex)
         local r,g,b
         b = tonumber("0x"..hex:sub(1,2))
         g = tonumber("0x"..hex:sub(3,4))
         r = tonumber("0x"..hex:sub(5,6))
         return {r,g,b}
end

function rgbToHex(rgb)
         return string.format("%02X",rgb[3])..string.format("%02X",rgb[2])..string.format("%02X",rgb[1])
end

function round(num)
         return math.floor(num+.5)
end
local fromColor1 = {};local toColor1 = {};local colorSpeed1 = {r,g,b};local transitionTarget1;local speeeeeeed1 = 0;local speedc1 = 0;local transitionOption1 = {completeOldColor = true}function transitionTimer1(sender)         transitionTarget1.bevelcolor = "0x"..rgbToHex(fromColor1);         fromColor1[1] = fromColor1[1] + colorSpeed1.r;         fromColor1[2] = fromColor1[2] + colorSpeed1.g;         fromColor1[3] = fromColor1[3] + colorSpeed1.b;         speedc1 = speedc1+1;         if speedc1 >= speeeeeeed1 then transitionTarget1.bevelcolor = "0x"..rgbToHex(toColor1) speedc1 = 0 transitionColor1.enabled = false return end;end;if transitionColor1 == nil then transitionColor1 = createTimer(nil) end;transitionColor1.interval = 1;transitionColor1.ontimer = transitionTimer1;transitionColor1.enabled = false;function gotoColor1(object, color, speed)         speedc1 = 0;         speeeeeeed1 = speed;         if transitionOption1.completeOldColor then            if transitionTarget1 ~= nil then transitionTarget1.bevelcolor = "0x"..rgbToHex(toColor1) end;         end         transitionTarget1 = object;         fromColor1 = hexToRGB(string.format("%06X",object.bevelcolor));         toColor1 = color;         colorSpeed1.r = round((toColor1[1]-fromColor1[1])/speed);         colorSpeed1.g = round((toColor1[2]-fromColor1[2])/speed);         colorSpeed1.b = round((toColor1[3]-fromColor1[3])/speed);         transitionColor1.enabled = true;end
local fromColor2 = {};local toColor2 = {};local colorSpeed2 = {r,g,b};local transitionTarget2;local speeeeeeed2 = 0;local speedc2 = 0;local transitionOption2 = {completeOldColor = true}function transitionTimer2(sender)         transitionTarget2.color = "0x"..rgbToHex(fromColor2);         fromColor2[1] = fromColor2[1] + colorSpeed2.r;         fromColor2[2] = fromColor2[2] + colorSpeed2.g;         fromColor2[3] = fromColor2[3] + colorSpeed2.b;         speedc2 = speedc2+1;         if speedc2 >= speeeeeeed2 then transitionTarget2.color = "0x"..rgbToHex(toColor2) speedc2 = 0 transitionColor2.enabled = false return end;end;if transitionColor2 == nil then transitionColor2 = createTimer(nil) end;transitionColor2.interval = 1;transitionColor2.ontimer = transitionTimer2;transitionColor2.enabled = false;function gotoColor2(object, color, speed)         speedc2 = 0;         speeeeeeed2 = speed;         if transitionOption2.completeOldColor then            if transitionTarget2 ~= nil then transitionTarget2.color = "0x"..rgbToHex(toColor2) end;         end         transitionTarget2 = object;         fromColor2 = hexToRGB(string.format("%06X",object.color));         toColor2 = color;         colorSpeed2.r = round((toColor2[1]-fromColor2[1])/speed);         colorSpeed2.g = round((toColor2[2]-fromColor2[2])/speed);         colorSpeed2.b = round((toColor2[3]-fromColor2[3])/speed);         transitionColor2.enabled = true;end

function formdrag]]..rand..[[()
]]..fn.name..[[.dragNow()
end

function closeform]]..rand..[[()
os.exit()
end]]


   fn.borderstyle = "bsNone"
   fn.name = fn.name
   fn.color = 0x1D1D1D
   fn.font.color = 0xc0c0c0
   fn.font.name = "Calibri"

   _ENV["body"..rand] = createPanel(fn)
   _ENV["body"..rand].name = "body"..rand
   _ENV["body"..rand].caption = ""
   _ENV["body"..rand].left = 0
   _ENV["body"..rand].top = 0
   _ENV["body"..rand].width = fn.width
   _ENV["body"..rand].height = fn.height-1
   _ENV["body"..rand].color = 0x1E1E1E
   _ENV["body"..rand].BevelColor = 0x0F0F0F
   _ENV["body"..rand].onmousedown = "formdrag"..rand

   _ENV["bluebar"..rand] = createPanel(fn)
   _ENV["bluebar"..rand].name = "bluebar"..rand
   _ENV["bluebar"..rand].caption = ""
   _ENV["bluebar"..rand].left = 0
   _ENV["bluebar"..rand].top = 0
   _ENV["bluebar"..rand].width = fn.width
   _ENV["bluebar"..rand].height = 1
   _ENV["bluebar"..rand].color = 0xEC8C71
   _ENV["bluebar"..rand].BevelOuter = "bvNone"
   _ENV["bluebar"..rand].onmousedown = "formdrag"..rand
   _ENV["bluebar"..rand].setParent(_ENV["body"..rand])

   _ENV["title"..rand] = createLabel(fn)
   _ENV["title"..rand].name = "title"..rand
   _ENV["title"..rand].caption = fn.caption
   _ENV["title"..rand].font.color = 0xEC8C71
   _ENV["title"..rand].left = 12
   _ENV["title"..rand].top = 9
   _ENV["title"..rand].setParent(_ENV["body"..rand])
   _ENV["title"..rand].onmousedown = "formdrag"..rand

   _ENV["close"..rand] = createLabel(fn)
   _ENV["close"..rand].name = "close"..rand
   _ENV["close"..rand].caption = "X"
   _ENV["close"..rand].font.color = 0xEC8C71
   _ENV["close"..rand].left = _ENV["body"..rand].width - 18
   _ENV["close"..rand].top = 9
   _ENV["close"..rand].setParent(_ENV["body"..rand])
   _ENV["close"..rand].onclick = "closeform"..rand
end

ceskin.theme.items.clear()
ceskin.theme.items.add("Flat Purple")
ceskin.theme.items.add("Dark Bluish")
ceskin.theme.items.add("Smooth Dark-Blue")

function UDF1_MenuItem1Click(sender)
         ceskin.formlist.items.clear()
         c = 4
         while true do
               if MainForm.miTable[c].caption:find("-") then break end
               ceskin.formlist.items.add(MainForm.miTable[c].caption)
               c = c+1
         end
end

function getFormIndexByName(name)
         c = 4
         while true do
               if MainForm.miTable[c].caption == name then return c end
               c = c+1
         end
         return -1
end

function closeFormDesigner()
         local c = 0
         while true do
               if MainForm.getComponent(c).name:find("FormDesigner") then
                  MainForm[MainForm.getComponent(c).name].close()
                  return
               end
               c = c+1
         end
end

function UDF1_CEComboBox2Change(sender)
         ceskin.componentList.items.clear()
         if skins.components[sender.itemindex].button ~= nil then
            ceskin.componentList.items.add("Button")
         end
         if skins.components[sender.itemindex].editbox ~= nil then
            ceskin.componentList.items.add("Editbox")
         end
         if skins.components[sender.itemindex].checkbox ~= nil then
            ceskin.componentList.items.add("Checkbox")
         end
         if skins.components[sender.itemindex].listbox ~= nil then
            ceskin.componentList.items.add("Listbox")
         end
         if skins.components[sender.itemindex].memo ~= nil then
            ceskin.componentList.items.add("Memo")
         end
         if skins.components[sender.itemindex].pagecontrol ~= nil then
            ceskin.componentList.items.add("Page Control")
         end
end

function UDF1_CEButton1Click(sender)
         local c = 0
         while true do
               if skins.names[c] == nil then break end
               if skins.names[c] == ceskin.theme.text then
                  MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
                  fname = ceskin.formlist.text
                  skins.formskin[c](_ENV[ceskin.formlist.text])
                  closeFormDesigner()
                  MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
               end
               c = c+1
         end
end

function UDF1_addcompClick(sender)
         _type = ceskin.componentList.items[ceskin.componentList.itemindex]
         index = ceskin.theme.itemindex
         if _type == "Button" then
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
            skins.components[index].button(_ENV[ceskin.formlist.text])
            closeFormDesigner()
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
         end
         if _type == "Editbox" then
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
            skins.components[index].editbox(_ENV[ceskin.formlist.text])
            closeFormDesigner()
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
         end
         if _type == "Checkbox" then
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
            skins.components[index].checkbox(_ENV[ceskin.formlist.text])
            closeFormDesigner()
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
         end
         if _type == "Listbox" then
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
            skins.components[index].listbox(_ENV[ceskin.formlist.text])
            closeFormDesigner()
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
         end
         if _type == "Memo" then
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
            skins.components[index].memo(_ENV[ceskin.formlist.text])
            closeFormDesigner()
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
         end
         if _type == "Page Control" then
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
            skins.components[index].pagecontrol(_ENV[ceskin.formlist.text])
            closeFormDesigner()
            MainForm.miTable[getFormIndexByName(ceskin.formlist.text)][1].doClick()
         end
end
function UDF1_MenuItem2Click(sender)
   showMessage("Created by Lynxz Gaming, github : adhptrh/cefskin")
end
