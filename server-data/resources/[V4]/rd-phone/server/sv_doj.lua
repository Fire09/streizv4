RPC.register("rd-gov:getDOJData", function(pSource)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local list = Await(SQL.execute("SELECT * FROM doj_duty", {}))
    local myData = Await(SQL.execute("SELECT status FROM doj_duty WHERE cid = @cid", {
        ["cid"] = cid
    }))

    return list, myData[1].status
end)

RPC.register("rd-gov:dojApp:setStatus", function(pSource, pJob, pStatus)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local update = Await(SQL.execute("UPDATE doj_duty SET status = @status WHERE cid = @cid AND job = @job", {
        ["status"] = pStatus.param,
        ["cid"] = cid,
        ["job"] = pJob.param
    }))
end)