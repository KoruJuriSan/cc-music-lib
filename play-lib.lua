local function playBuffer(buffer, speakers, vol)
    local returnValue = nil
    local callbacks = {}

    for i, speaker in pairs(speakers) do
        if i > 1 then
            table.insert(callbacks, function()
                speaker.playAudio(buffer, vol or 3.0)
            end)
        else
            table.insert(callbacks, function()
                returnValue = speaker.playAudio(buffer, vol or 3.0)
            end)
        end
    end

    parallel.waitForAll(table.unpack(callbacks))

    return returnValue
end

function play(uri, volume)
    local dfpwm = require("cc.audio.dfpwm")
    local speakers = { peripheral.find("speaker") }
    local decoder = dfpwm.make_decoder()
    local response = http.get(uri, nil, true)
    local formatedVolume = 3.0
    if (volume) ~= nil then
        local formatedVolume = math.floor((volume/100)*3.0)
    end

    local chunkSize = 2 * 1024
    local chunk = response.read(chunkSize)
    while chunk ~= nil do
        local buffer = decoder(chunk)

        while not playBuffer(buffer, speakers, formatedVolume) do
            os.pullEvent("speaker_audio_empty")
        end

        chunk = response.read(chunkSize)
    end
    return true
end

function play_playlist(uris, volume)
    for k,uri in pairs(uris) do
        play(uri, volume)
    end
end

-- one url on each and every line of the file
-- with http/https IN IT!!!
-- eg: http://server-or-ip.net/file.wav
function readfile_to_uris(path)
    if (fs.exists(path)) then
        if (not fs.isDir(path)) then
            local file = fs.open(path, "r")
            local uris = {}
            local line = nil
            repeat
                line = file.readLine()
                if line ~= nil then
                    table.insert(uris, line)
                end
            until line == nil
                file.close()
            return uris
        end
    end
end

function play_from_file(path, volume)
    local uris = readfile_to_uris(path, volume)
    play_playlist(uris, volume)
end