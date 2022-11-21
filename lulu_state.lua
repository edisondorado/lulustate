script_name('Lulu State') 
script_version("1")
date_update = "Обновление от 12.12.2012"
script_author('Alan Butler') -- vk.com/alanbutler
script_properties("work-in-pause")

require 'lib.sampfuncs'
require 'lib.moonloader'

local sampev = require 'lib.samp.events'
local vkeys = require 'vkeys'
local rkeys = require 'rkeys'
local inicfg = require "inicfg"
local imgui = require 'mimgui'
local ffi = require 'ffi'
local fa = require("fAwesome5")
local addons = require "ADDONS"
local base64 = require('base64')
local wm = require 'windows.message'
local vector = require "vector3d"
local memory = require("memory")
local cjson = require "cjson"
local dlstatus = require('moonloader').download_status

local encoding = require 'encoding'
encoding.default = 'CP1251'
local u8 = encoding.UTF8
local new, str, sizeof = imgui.new, ffi.string, ffi.sizeof
sw, sh 	= getScreenResolution()

if not doesDirectoryExist(getWorkingDirectory()..'\\Lulu State') then
    createDirectory(getWorkingDirectory()..'\\Lulu State')
end

local dirIni = "..\\Lulu State\\settings.ini"
local ini = inicfg.load({
    main = {
        fraction = -1,
    }
}, dirIni)
inicfg.save(ini, dirIni)
inicfg.load(ini, dirIni)

local thisScript = script.this

function json(filePath)
    local filePath = getWorkingDirectory()..'\\Lulu State\\'..(filePath:find('(.+).json') and filePath or filePath..'.json')
    local class = {}
    if not doesDirectoryExist(getWorkingDirectory()..'\\Lulu State') then
        createDirectory(getWorkingDirectory()..'\\Lulu State')
    end
    
    function class:Save(tbl)
        if tbl then
            local F = io.open(filePath, 'w')
            F:write(encodeJson(tbl) or {})
            F:close()
            return true, 'ok'
        end
        return false, 'table = nil'
    end
  
    function class:Load(defaultTable)
        if not doesFileExist(filePath) then
            class:Save(defaultTable or {})
        end
        local F = io.open(filePath, 'r+')
        local TABLE = decodeJson(F:read() or {})
        F:close()
        for def_k, def_v in next, defaultTable do
            if TABLE[def_k] == nil then
                TABLE[def_k] = def_v
            end
        end
        return TABLE
    end
  
    return class
end

--                      Теги

local tag_err = "{FF7F50}[Ошибка] {FFFFFF}"
local tag_q =  "{9370DB}[Lulu State]{FFFFFF}: "
local tag = "{9370DB}[Lulu State]{FFFFFF}: "

----------------------------------------------------------- 

function main()
    if not isSampLoaded()  then return end
    while  not isSampAvailable() do wait(100) end
    local ip, port = sampGetCurrentServerAddress()
    if ip ~= "80.66.82.168" then
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        sampAddChatMessage(tag_err.."Скрипт работает только на сервере Arizona RP - Page ", -1)
        thisScript:unload()        
    end
    if not doesFileExist(getGameDirectory()..'\\_CoreGame.asi') then
        sampAddChatMessage(tag_err..'Внимание! Lulu State был предназначен для Лаунчера Arizona Games, при игре со сторонних клиентов, возможны ошибки.', -1)
      end
    sampAddChatMessage(tag.."Успешно загружен.", -1)
    while true do
        wait(0)

    end
end


