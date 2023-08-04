local ActiveParticles = {}
local BlacklistedParticles = {}

TriggerServerEvent("particles:player:ready")

function LoadParticleDictionary(dictionary)
    if not HasNamedPtfxAssetLoaded(dictionary) then
        RequestNamedPtfxAsset(dictionary)
        while not HasNamedPtfxAssetLoaded(dictionary) do
            Citizen.Wait(0)
        end
    end
end

function AddBlacklistedParticle(pDict, pName)
    BlacklistedParticles[('%s@%s'):format(pDict, pName)] = true
end

exports('AddBlacklistedParticle', AddBlacklistedParticle)

function RemoveBlacklistedParticle(pDict, pName)
    BlacklistedParticles[('%s@%s'):format(pDict, pName)] = nil
end

exports('RemoveBlacklistedParticle', RemoveBlacklistedParticle)

function IsParticleBlacklisted(pDict, pName)
    return BlacklistedParticles[('%s@%s'):format(pDict, pName)]
end

exports('IsParticleBlacklisted', IsParticleBlacklisted)

function StartParticleAtCoord(ptDict, ptName, looped, coords, rot, scale, alpha, color, duration)
    LoadParticleDictionary(ptDict)

    UseParticleFxAssetNextCall(ptDict)

    local particleHandle

    if looped then
        particleHandle = StartParticleFxLoopedAtCoord(ptName, coords.x, coords.y, coords.z, rot.x, rot.y, rot.z, scale or 1.0)

        if color then
            SetParticleFxLoopedColour(particleHandle, color.r, color.g, color.b, false)
        end

        SetParticleFxLoopedAlpha(particleHandle, alpha or 10.0)

        if duration then
            Citizen.Wait(duration)
            StopParticleFxLooped(particleHandle, 0)
        end
    else
        SetParticleFxNonLoopedAlpha(alpha or 10.0)

        if color then
            SetParticleFxNonLoopedColour(color.r, color.g, color.b)
        end

        StartParticleFxNonLoopedAtCoord(ptName, coords.x, coords.y, coords.z, rot.x, rot.y, rot.z, scale or 1.0)
    end

    return particleHandle
end

function StartParticleOnEntity(ptDict, ptName, looped, entity, bone, offset, rot, scale, alpha, color, evolution, duration)
    LoadParticleDictionary(ptDict)

    UseParticleFxAssetNextCall(ptDict)

    local particleHandle, boneID

    if bone and GetEntityType(entity) == 1 then
        boneID = GetPedBoneIndex(entity, bone)
    elseif bone then
        boneID = GetEntityBoneIndexByName(entity, bone)
    end

    if looped then
        if bone then
            particleHandle = StartParticleFxLoopedOnEntityBone(ptName, entity, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, boneID, scale)
        else
            particleHandle = StartParticleFxLoopedOnEntity(ptName, entity, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, scale)
        end

        if evolution then
            SetParticleFxLoopedEvolution(particleHandle, evolution.name, evolution.amount, false)
        end

        if color then
            SetParticleFxLoopedColour(particleHandle, color.r, color.g, color.b, false)
        end

        SetParticleFxLoopedAlpha(particleHandle, alpha)

        if duration then
            Citizen.Wait(duration)
            StopParticleFxLooped(particleHandle, 0)
        end
    else
        SetParticleFxNonLoopedAlpha(alpha or 10.0)

        if color then
            SetParticleFxNonLoopedColour(color.r, color.g, color.b)
        end

        if bone then
            StartParticleFxNonLoopedOnPedBone(ptName, entity, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, boneID, scale)
        else
            StartParticleFxNonLoopedOnEntity(ptName, entity, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, scale)
        end
    end

    return particleHandle
end

RegisterNetEvent("particle:sync:coord")
AddEventHandler("particle:sync:coord", function(ptDict, ptName, looped, position, duration, ptID)
    if type(position.coords) == "table" then
        local particles = {}

        if IsParticleBlacklisted(ptDict, ptName) then return end

        for _, coords in ipairs(position.coords) do
            local particle = promise:new()

            Citizen.CreateThread(function()
                local particleHandle = StartParticleAtCoord(ptDict, ptName, looped, coords, position.rot, position.scale, position.alpha, position.color, duration)
                particle:resolve(particleHandle)
            end)

            particles[#particles + 1] = particle
        end

        if not duration and ptID then
            ActiveParticles[ptID] = particles
        end
    else
        local particleHandle = StartParticleAtCoord(ptDict, ptName, looped, position.coords, position.rot, position.scale, position.alpha, position.color, duration)

        if not duration and ptID then
            ActiveParticles[ptID] = particleHandle
        end
    end
end)

RegisterNetEvent("particle:explosion:coord")
AddEventHandler("particle:explosion:coord", function(position)
  -- local i = 0
  -- local try = {
  --   -- [6] = true,
  --   -- [9] = true,
  --   -- [15] = true,
  --   [29] = true,
  --   [37] = true,
  -- --   [49] = true,
  -- --   [50] = true,
  -- --   [59] = true,
  -- --   [60] = true,
  -- }
  -- while i < 100 do
  --   if try[i] == true then
  --     AddExplosion(position, i, 5.0, 1, 0, 1)
  --     print(i)
  --     Wait(2500)
  --   end
  --   i = i + 1
  -- end
  AddExplosion(position, 29, 5.0, 1, 0, 1, 1)
  Wait(500)
  StopFireInRange(position, 5.0)
end)

RegisterNetEvent("particle:sync:entity")
AddEventHandler("particle:sync:entity", function(ptDict, ptName, looped, target, bone, position, duration, ptID)
    local entity = NetworkGetEntityFromNetworkId(target)

    if IsParticleBlacklisted(ptDict, ptName) then return end

    if type(bone) == "table" then
        local particles = {}

        for _, boneName in ipairs(bone) do
            local particle = promise:new()

            Citizen.CreateThread(function()
                local particleHandle = StartParticleOnEntity(ptDict, ptName, looped, entity, boneName, position.offset, position.rot, position.scale, position.alpha, position.color, position.evolution, duration)
                particle:resolve(particleHandle)
            end)

            particles[#particles + 1] = particle
        end

        if not duration and ptID then
            ActiveParticles[ptID] = particles
        end
    else
        local particleHandle = StartParticleOnEntity(ptDict, ptName, looped, entity, bone, position.offset, position.rot, position.scale, position.alpha, position.color, position.evolution, duration)

        if not duration and ptID then
            ActiveParticles[ptID] = particleHandle
        end
    end
end)

RegisterNetEvent("particle:sync:player")
AddEventHandler("particle:sync:player", function(ptDict, ptName, looped, target, bone, position, duration, ptID)
    local entity = GetPlayerPed(GetPlayerFromServerId(target))

    if IsParticleBlacklisted(ptDict, ptName) then return end

    if type(bone) == "table" then
        local particles = {}

        for _, boneName in ipairs(bone) do
            local particle = promise:new()

            Citizen.CreateThread(function()
                local particleHandle = StartParticleOnEntity(ptDict, ptName, looped, entity, boneName, position.offset, position.rot, position.scale, position.alpha, position.color, position.evolution, duration)
                particle:resolve(particleHandle)
            end)

            particles[#particles + 1] = particle
        end

        if not duration and ptID then
            ActiveParticles[ptID] = particles
        end
    else
        local particleHandle = StartParticleOnEntity(ptDict, ptName, looped, entity, bone, position.offset, position.rot, position.scale, position.alpha, position.color, position.evolution, duration)

        if not duration and ptID then
            ActiveParticles[ptID] = particleHandle
        end
    end
end)

RegisterNetEvent("particle:sync:toggle:stop")
AddEventHandler("particle:sync:toggle:stop", function(ptID)
    if ActiveParticles[ptID] then
        if type(ActiveParticles[ptID]) == "table" then
            for _, particleHandle in ipairs(ActiveParticles[ptID]) do
                StopParticleFxLooped(Citizen.Await(particleHandle), 0)
            end
        else
            StopParticleFxLooped(ActiveParticles[ptID], 0)
        end
        ActiveParticles[ptID] = nil
    end
end)

-- Useful for local particles
exports("StartParticleAtCoord", StartParticleAtCoord)
exports("StartParticleOnEntity", StartParticleOnEntity)

CreateThread(function()
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-551.12, 284.66, 82.98), 7.4, 3.0, {
      heading=355,
      minZ=81.78,
      maxZ=84.78,
      data = {
        id = "tequilala:stage",
        ranges = {
          {
            mode = 3,
            range = 30.0,
            priority = 3
          }
        }
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-439.78, 277.39, 83.41), 1.8, 1.4, {
      heading=355,
      minZ=82.06,
      maxZ=85.26,
      data = {
        id = "comedyclub:stage",
        ranges = {
          {
            mode = 3,
            range = 30.0,
            priority = 3
          }
        }
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-1381.94, -615.02, 31.5), 2.0, 4.0, {
      heading=303,
      minZ=29.9,
      maxZ=33.9,
      data = {
        id = "bahamamamas:stage",
        ranges = {
          {
            mode = 3,
            range = 30.0,
            priority = 3
          }
        }
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(440.84, -985.84, 34.97), 1.0, 1.4, {
      heading=0,
      minZ=33.97,
      maxZ=36.77,
      data = {
        id = "pd:classroom:podium",
        ranges = {
          {
            mode = 2,
            range = 5.0,
            priority = 3
          },
          {
            mode = 3,
            range = 10.0,
            priority = 3
          }
        },
        filter = "podium"
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-570.29, -929.6, 23.97), 3.4, 2.0, {
      heading=0,
      minZ=22.97,
      maxZ=25.77,
      data = {
        id = "lsnews:anchor:stage",
        ranges = {
          {
            mode = 3,
            range = 10.0,
            priority = 3
          }
        }
      }
    })
  
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-1540.23, -274.03, 54.65), 1.2, 1.6, {
      heading=322,
      minZ=53.65,
      maxZ=56.45,
      data = {
        id = "mandem:stage",
        ranges = {
          {
            mode = 3,
            range = 30.0,
            priority = 3
          }
        }
      }
    })
  
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-53.87, -2444.64, 28.82), 8.05, 2.4, {
      heading=325,
      minZ=27.72,
      maxZ=31.32,
      data = {
        id = "driftschool:stage",
        ranges = {
          {
            mode = 3,
            range = 150.0,
            priority = 3
          }
        }
      }
    })
  
  
    exports["rd-polyzone"]:AddPolyZone("rd-fx:audio:stage", {
      vector2(667.98602294922, 576.31848144531),
      vector2(679.03790283203, 590.67059326172),
      vector2(700.68853759766, 582.84783935547),
      vector2(699.16333007812, 564.87322998047),
      vector2(689.61529541016, 568.25823974609),
      vector2(687.34429931641, 566.87066650391),
      vector2(683.13262939453, 566.18231201172),
      vector2(679.07061767578, 569.24786376953),
      vector2(677.82830810547, 572.54663085938),
      vector2(676.77917480469, 572.95831298828)
    }, {
      minZ = 129.54597473145,
      maxZ = 137.46141052246,
      data = {
        id = "vinewood:bowl:stage",
        ranges = {
          {
            mode = 3,
            range = 75.0,
            priority = 3
          }
        }
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(485.62, -988.78, 26.27), 4.5, 5.6, {
      heading=0,
      minZ=25.27,
      maxZ=28.077,
      data = {
        id = "pd:interrogation:1",
        ranges = {
          {
            mode = 1,
            range = 4.0,
            priority = 2
          },
          {
            mode = 2,
            range = 4.0,
            priority = 2
          }
        }
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(485.65, -996.87, 26.27), 4.4, 5.6, {
      heading=0,
      minZ=25.27,
      maxZ=28.07,
      data = {
        id = "pd:interrogation:2",
        ranges = {
          {
            mode = 1,
            range = 4.0,
            priority = 2
          },
          {
            mode = 2,
            range = 4.0,
            priority = 2
          }
        }
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-839.96, -718.49, 28.06), 6.2, 4.6, {
      heading=140,
      minZ=26.91,
      maxZ=30.51,
      data = {
        id = "wuchang:stage",
        ranges = {
          {
            mode = 3,
            range = 30.0,
            priority = 2
          }
        }
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-1714.29, -1120.51, 13.96), 6.4, 9.4, {
      heading=47.0,
      minZ=12.16,
      maxZ=17.36,
      data = {
        id = "deanworld:stage",
        ranges = {
          {
            mode = 3,
            range = 30.0,
            priority = 3
          }
        }
      }
    })
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-490.08, 30.27, 52.41), 3.6, 4.2, {
      heading=356,
      minZ=51.61,
      maxZ=54.21,
      data = {
        id = "gallery:stage",
        ranges = {
          {
            mode = 3,
            range = 20.0,
            priority = 2,
          },
        },
      },
    })
  
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(1770.26, 2492.41, 50.43), 2.0, 1.0, {
      heading=30,
      minZ=49.43,
      maxZ=51.43,
      data = {
        id = "prison:doc:megaphone:1",
        ranges = {
          {
            mode = 3,
            range = 20.0,
            priority = 3,
          },
        },
      },
    })
  
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(1691.0, 2529.05, 54.88), 2.0, 10.6, {
      heading=0,
      minZ=53.88,
      maxZ=56.48,
      data = {
        id = "prison:doc:megaphone:2",
        ranges = {
          {
            mode = 3,
            range = 100.0,
            priority = 3,
          },
        },
      },
    })
  
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(1721.07, 2527.79, 46.68), 2, 2, {
      heading=27,
      minZ=45.68,
      maxZ=47.88,
      data = {
        id = "prison:doc:stagemic:1",
        ranges = {
          {
            mode = 3,
            range = 15.0,
            priority = 3,
          },
        },
      },
    })
  
    exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(-128.64, -607.63, 40.42), 1.4, 1.4, {
      heading=30,
      minZ=39.22,
      maxZ=41.42,
      data = {
        id = "cbc:1",
        ranges = {
          {
            mode = 3,
            range = 50.0,
            priority = 1,
          },
        },
      },
    })
  
  --   temp for xmas stage
  --   exports["rd-polyzone"]:AddBoxZone("rd-fx:audio:stage", vector3(202.38, -928.44, 31.51), 4.0, 4.0, {
  --     heading=325,
  --     minZ=30.31,
  --     maxZ=32.51,
  --     data = {
  --       id = "xmas:temp:legion",
  --       ranges = {
  --         {
  --           mode = 3,
  --           range = 10.0,
  --           priority = 3
  --         }
  --       }
  --     }
  --   })
  end)
  
  AddEventHandler("rd-polyzone:enter", function(zone, data)
    if zone == "rd-fx:audio:stage" then
      MumbleSetAudioInputIntent(`music`)
      if data.filter then
        TriggerServerEvent("rd:voice:transmission:state", -1, data.filter, true, data.filter)
      end
      TriggerEvent('rd:voice:proximity:override', data.id, data.ranges)
    end
  end)
  
  AddEventHandler("rd-polyzone:exit", function(zone, data)
    if zone == "rd-fx:audio:stage" then
      MumbleSetAudioInputIntent(`speech`)
      if data.filter then
        TriggerServerEvent("rd:voice:transmission:state", -1, data.filter, false, data.filter)
      end
      TriggerEvent('rd:voice:proximity:override', data.id, data.ranges, -1, -1)
    end
  end)