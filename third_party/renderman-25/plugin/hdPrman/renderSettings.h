//
// Copyright 2022 Pixar
//
// Licensed under the Apache License, Version 2.0 (the "Apache License")
// with the following modification; you may not use this file except in
// compliance with the Apache License and the following modification to it:
// Section 6. Trademarks. is deleted and replaced with:
//
// 6. Trademarks. This License does not grant permission to use the trade
//    names, trademarks, service marks, or product names of the Licensor
//    and its affiliates, except as required to comply with Section 4(c) of
//    the License and to reproduce the content of the NOTICE file.
//
// You may obtain a copy of the Apache License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the Apache License with the above modification is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the Apache License for the specific
// language governing permissions and limitations under the Apache License.
//
<<<<<<< HEAD
#ifndef EXT_RMANPKG_24_0_PLUGIN_RENDERMAN_PLUGIN_HD_PRMAN_RENDER_SETTINGS_H
#define EXT_RMANPKG_24_0_PLUGIN_RENDERMAN_PLUGIN_HD_PRMAN_RENDER_SETTINGS_H
=======
#ifndef EXT_RMANPKG_25_0_PLUGIN_RENDERMAN_PLUGIN_HD_PRMAN_RENDER_SETTINGS_H
#define EXT_RMANPKG_25_0_PLUGIN_RENDERMAN_PLUGIN_HD_PRMAN_RENDER_SETTINGS_H
>>>>>>> 10b62439e9242a55101cf8b200f2c7e02420e1b0

#include "pxr/pxr.h"
#include "pxr/imaging/hd/renderSettings.h"

<<<<<<< HEAD
#include "Riley.h"
=======
#include "RiTypesHelper.h" // for RtParamList
>>>>>>> 10b62439e9242a55101cf8b200f2c7e02420e1b0

PXR_NAMESPACE_OPEN_SCOPE

class HdPrman_RenderSettings final : public HdRenderSettings
{
public:
    HdPrman_RenderSettings(SdfPath const& id);

    ~HdPrman_RenderSettings() override;

<<<<<<< HEAD
=======
    const RtParamList& GetOptions() const {
        return _settingsOptions;
    }

>>>>>>> 10b62439e9242a55101cf8b200f2c7e02420e1b0
    void Finalize(HdRenderParam *renderParam) override;

    void _Sync(HdSceneDelegate *sceneDelegate,
               HdRenderParam *renderParam,
               const HdDirtyBits *dirtyBits) override;
<<<<<<< HEAD
=======

private:
    RtParamList _settingsOptions;
>>>>>>> 10b62439e9242a55101cf8b200f2c7e02420e1b0
};


PXR_NAMESPACE_CLOSE_SCOPE

<<<<<<< HEAD
#endif // EXT_RMANPKG_24_0_PLUGIN_RENDERMAN_PLUGIN_HD_PRMAN_VOLUME_H
=======
#endif // EXT_RMANPKG_25_0_PLUGIN_RENDERMAN_PLUGIN_HD_PRMAN_VOLUME_H
>>>>>>> 10b62439e9242a55101cf8b200f2c7e02420e1b0
