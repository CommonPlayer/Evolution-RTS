-- $Id$
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local materials = {
   normalMappedS3o = {
       shaderDefinitions = {
         "#define use_perspective_correct_shadows",
         "#define use_normalmapping",
         --"#define flip_normalmap",
       },
       shader    = include(GADGET_DIR .. "UnitMaterials/Shaders/default.lua"),
       usecamera = false,
       culling   = GL.BACK,
       predl  = nil,
       postdl = nil,
       texunits  = {
         [0] = '%%UNITDEFID:0',
         [1] = '%%UNITDEFID:1',
         [2] = '$shadow',
         [3] = '$specular',
         [4] = '$reflection',
         [5] = '%NORMALSTEX',
       },
   },
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Automated normalmap detection

local unitMaterials = {}

local function FindNormalmap(tex1, tex2)
  local normalstex

  --// check if there is a corresponding _normals.dds file
  if (VFS.FileExists(tex1)) then
    local basefilename = tex1:gsub("%....","")
    if (tonumber(basefilename:sub(-1,-1))) then
      basefilename = basefilename:sub(1,-2)
    end
    if (basefilename:sub(-1,-1) == "_") then
       basefilename = basefilename:sub(1,-2)
    end
    normalstex = basefilename .. "_normals.dds"
    if (not VFS.FileExists(normalstex)) then
      normalstex = nil
    end
  end --if FileExists

  if (not normalstex) and tex2 and (VFS.FileExists(tex2)) then
    local basefilename = tex2:gsub("%....","")
    if (tonumber(basefilename:sub(-1,-1))) then
      basefilename = basefilename:sub(1,-2)
    end
    if (basefilename:sub(-1,-1) == "_") then
      basefilename = basefilename:sub(1,-2)
    end
    normalstex = basefilename .. "_normals.dds"
    if (not VFS.FileExists(normalstex)) then
      normalstex = nil
    end
  end

  return normalstex
end



for i=1,#UnitDefs do
  local udef = UnitDefs[i]

  if (udef.customParams.normalstex and VFS.FileExists(udef.customParams.normalstex)) then
    unitMaterials[udef.name] = {"normalMappedS3o", NORMALSTEX = udef.customParams.normalstex}

  elseif (udef.model.type == "s3o") then
    local modelpath = udef.model.path
    if (modelpath) then
      --// udef.model.textures is empty at gamestart, so read the texture filenames from the s3o directly

      local rawstr = VFS.LoadFile(modelpath)
      local header = rawstr:sub(1,60)
      local texPtrs = VFS.UnpackU32(header, 45, 2)
      local tex1,tex2
      if (texPtrs[2] > 0)
        then tex2 = "unittextures/" .. rawstr:sub(texPtrs[2]+1, rawstr:len()-1)
        else texPtrs[2] = rawstr:len() end
      if (texPtrs[1] > 0)
        then tex1 = "unittextures/" .. rawstr:sub(texPtrs[1]+1, texPtrs[2]-1) end

      -- output units without tex2
      if not tex2 then
        Spring.Log(gadget:GetInfo().name, LOG.WARNING, "CustomUnitShaders: " .. udef.name .. " no tex2")
      end

      local normalstex = FindNormalmap(tex1,tex2)
      if (normalstex and not unitMaterials[udef.name]) then
        unitMaterials[udef.name] = {"normalMappedS3o", NORMALSTEX = normalstex}
      end
    end --if model

  elseif (udef.model.type == "obj") then
    local modelinfopath = udef.model.path
    if (modelinfopath) then
      modelinfopath = modelinfopath .. ".lua"

      if (VFS.FileExists(modelinfopath)) then
        local infoTbl = Include(modelinfopath)
        if (infoTbl) then
          local tex1 = "unittextures/" .. (infoTbl.tex1 or "")
          local tex2 = "unittextures/" .. (infoTbl.tex2 or "")

          -- output units without tex2
          if not tex2 then
            Spring.Log(gadget:GetInfo().name, LOG.WARNING, "CustomUnitShaders: " .. udef.name .. " no tex2")
          end

          local normalstex = FindNormalmap(tex1,tex2)
          if (normalstex and not unitMaterials[udef.name]) then
            unitMaterials[udef.name] = {"normalMappedS3o", NORMALSTEX = normalstex}
          end
        end
      end
    end

  end --elseif
end --for

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return materials, unitMaterials

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------