function (visualgdb_bsp_load_system_variables)
    set(BSP_MCU_FAMILY "UNDEFINED")
    if("${BSP_MCU}" STREQUAL "nRF52832_XXAA")
        set(BSP_MCU_FAMILY "nRF5Xxxxx")
        set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.apiversion "NRF_SD_BLE_API_VERSION=6")
        set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mcumacro "NRF52832_XXAA")
        set(BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix "pca10040/s132")
        set(BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix_blank "pca10040")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode "-mfloat-abi=hard")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode "${BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice "S132")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" PARENT_SCOPE)
        endif()

    elseif("${BSP_MCU}" STREQUAL "nRF52840_XXAA")
        set(BSP_MCU_FAMILY "nRF5Xxxxx")
        set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.apiversion "NRF_SD_BLE_API_VERSION=6")
        set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mcumacro "NRF52840_XXAA")
        set(BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix "pca10056/s140")
        set(BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix_blank "pca10040")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode "-mfloat-abi=hard")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode "${BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice "S140")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" PARENT_SCOPE)
        endif()

    elseif("${BSP_MCU}" STREQUAL "nRF52810_XXAA")
        set(BSP_MCU_FAMILY "nRF5Xxxxx")
        set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.apiversion "NRF_SD_BLE_API_VERSION=6")
        set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mcumacro "NRF52810_XXAA")
        set(BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix "pca10040e/s112")
        set(BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix_blank "pca10040")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice "S112")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" PARENT_SCOPE)
        endif()

    else()
        message(FATAL_ERROR "Unknown MCU: ${mcu}")
    endif()
    if("${BSP_MCU_FAMILY}" STREQUAL "nRF5Xxxxx")
    endif()

    set(BSP_MCU_FAMILY "${BSP_MCU_FAMILY}" PARENT_SCOPE)
    set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.apiversion "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.apiversion}" PARENT_SCOPE)
    set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mcumacro "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mcumacro}" PARENT_SCOPE)
    set(BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix "${BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix}" PARENT_SCOPE)
    set(BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix_blank "${BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix_blank}" PARENT_SCOPE)
    set(_bsp_variables
        "BSP_MCU_FAMILY"
        "BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.apiversion"
        "BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mcumacro"
        "BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix"
        "BSP_CONFIGURATION_com.sysprogs.nordic.default_config_suffix_blank" PARENT_SCOPE)
endfunction() #visualgdb_bsp_load_system_variables

function (visualgdb_bsp_compute_mcu_family_flags family)
    if("${family}" STREQUAL "nRF5Xxxxx")
        set(_includes ${_includes}
            "."
            "${BSP_ROOT}/nRF5x/components/softdevice/${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}/headers"
            "${BSP_ROOT}/nRF5x/components/softdevice/${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}/headers/nrf52"
            "${BSP_ROOT}/nRF5x/modules/nrfx"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers"
            "${BSP_ROOT}/nRF5x/external/nrf_oberon"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include" PARENT_SCOPE)
        set(_defines ${_defines}
            "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mcumacro}"
            "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}"
            "NRF_DFU_SETTINGS_VERSION=1"
            "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.apiversion}" PARENT_SCOPE)
        set(_c_standard "99" PARENT_SCOPE)
        set(_cflags ${_cflags} "-mabi=aapcs" PARENT_SCOPE)
        set(_ldflags ${_ldflags} "-mabi=aapcs" "-L${BSP_ROOT}/nRF5x/SoftdeviceLibraries" "-L${BSP_ROOT}/nRF5x/LinkerScripts")
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
        set(_sources ${_sources}
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/system_nrf51.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/system_nrf52.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/system_nrf52810.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/system_nrf52840.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/arm_common_tables.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/arm_const_structs.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/arm_math.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/cmsis_armcc.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/cmsis_armcc_V6.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/cmsis_gcc.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_cm0.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_cm0plus.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_cm3.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_cm4.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_cm7.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_cmFunc.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_cmInstr.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_cmSimd.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_sc000.h"
            "${BSP_ROOT}/nRF5x/components/toolchain/cmsis/include/core_sc300.h")
        if("${BSP_MCU}" MATCHES "^nRF518.*")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/system_nrf51.c")
        endif()


        if("${BSP_MCU}" MATCHES "^nRF52832.*")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/system_nrf52.c")
        endif()


        if("${BSP_MCU}" MATCHES "^nRF52810.*")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/system_nrf52810.c")
        endif()


        if("${BSP_MCU}" MATCHES "^nRF52840.*")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/system_nrf52840.c")
        endif()


        set(_sources "${_sources}" PARENT_SCOPE)
    endif()
endfunction() #visualgdb_bsp_compute_mcu_family_flags


function (visualgdb_bsp_compute_mcu_flags mcu)
    if("${mcu}" STREQUAL "nRF52832_XXAA")
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines ${_defines} "ARM_MATH_CM4" "NRF52" PARENT_SCOPE)
        set(_cflags ${_cflags} "-mcpu=cortex-m4" "-mthumb" "-mfpu=fpv4-sp-d16" "${BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode}" PARENT_SCOPE)
        set(_ldflags ${_ldflags} "-mcpu=cortex-m4" "-mthumb" "-mfpu=fpv4-sp-d16" "${BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode}")
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
        set(_linker_script "${BSP_ROOT}/nRF5x/LinkerScripts/nRF52832_XXAA_${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}.lds" PARENT_SCOPE)
        set(_sources ${_sources} "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/gcc_startup_nrf52.S")
        set(_sources "${_sources}" PARENT_SCOPE)
    elseif("${mcu}" STREQUAL "nRF52840_XXAA")
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines ${_defines} "ARM_MATH_CM4" PARENT_SCOPE)
        set(_cflags ${_cflags} "-mcpu=cortex-m4" "-mthumb" "-mfpu=fpv4-sp-d16" "${BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode}" PARENT_SCOPE)
        set(_ldflags ${_ldflags} "-mcpu=cortex-m4" "-mthumb" "-mfpu=fpv4-sp-d16" "${BSP_CONFIGURATION_com.sysprogs.bspoptions.arm.floatmode}")
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
        set(_linker_script "${BSP_ROOT}/nRF5x/LinkerScripts/nRF52840_XXAA_${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}.lds" PARENT_SCOPE)
        set(_sources ${_sources} "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/gcc_startup_nrf52840.S")
        set(_sources "${_sources}" PARENT_SCOPE)
    elseif("${mcu}" STREQUAL "nRF52810_XXAA")
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines ${_defines} "ARM_MATH_CM4" PARENT_SCOPE)
        set(_cflags ${_cflags} "-mcpu=cortex-m4" "-mthumb" PARENT_SCOPE)
        set(_ldflags ${_ldflags} "-mcpu=cortex-m4" "-mthumb")
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
        set(_linker_script "${BSP_ROOT}/nRF5x/LinkerScripts/nRF52810_XXAA_${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}.lds" PARENT_SCOPE)
        set(_sources ${_sources} "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/gcc_startup_nrf52810.S")
        set(_sources "${_sources}" PARENT_SCOPE)
    else()
        message(FATAL_ERROR "Unknown MCU: ${mcu}")
    endif()
endfunction() #visualgdb_bsp_compute_mcu_flags


function (visualgdb_bsp_compute_conditional_flags)
    if(NOT ("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" STREQUAL "nosoftdev"))
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines ${_defines} "SOFTDEVICE_PRESENT")
        set(_defines "${_defines}" PARENT_SCOPE)
        set(_cflags "${_cflags}" PARENT_SCOPE)
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
    endif()

    if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" STREQUAL "nosoftdev")
        set(_includes ${_includes} "${BSP_ROOT}/nRF5x/components/drivers_nrf/nrf_soc_nosd")
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines "${_defines}" PARENT_SCOPE)
        set(_cflags "${_cflags}" PARENT_SCOPE)
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
    endif()

    if(NOT ("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.timer}" STREQUAL "none"))
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines ${_defines} "SWI_DISABLE0")
        set(_defines "${_defines}" PARENT_SCOPE)
        set(_cflags "${_cflags}" PARENT_SCOPE)
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
    endif()

    if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" STREQUAL "S132_reserve")
        set(_includes ${_includes} "${BSP_ROOT}/nRF5x/components/softdevice/S132/headers" "${BSP_ROOT}/nRF5x/components/softdevice/S132/headers/nrf52")
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines ${_defines} "S132")
        set(_defines "${_defines}" PARENT_SCOPE)
        set(_cflags "${_cflags}" PARENT_SCOPE)
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
    endif()

    if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" STREQUAL "S140_reserve")
        set(_includes ${_includes} "${BSP_ROOT}/nRF5x/components/softdevice/S140/headers" "${BSP_ROOT}/nRF5x/components/softdevice/S140/headers/nrf52")
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines ${_defines} "S140")
        set(_defines "${_defines}" PARENT_SCOPE)
        set(_cflags "${_cflags}" PARENT_SCOPE)
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
    endif()

    if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" STREQUAL "S112_reserve")
        set(_includes ${_includes} "${BSP_ROOT}/nRF5x/components/softdevice/S112/headers" "${BSP_ROOT}/nRF5x/components/softdevice/S112/headers/nrf52")
        set(_includes "${_includes}" PARENT_SCOPE)
        set(_defines ${_defines} "S112")
        set(_defines "${_defines}" PARENT_SCOPE)
        set(_cflags "${_cflags}" PARENT_SCOPE)
        set(_ldflags "${_ldflags}" PARENT_SCOPE)
    endif()

    set(_includes "${_includes}" PARENT_SCOPE)
    set(_defines "${_defines}" PARENT_SCOPE)
    set(_cflags "${_cflags}" PARENT_SCOPE)
    set(_ldflags "${_ldflags}" PARENT_SCOPE)
    set(_linker_script "${_linker_script}" PARENT_SCOPE)
endfunction() #visualgdb_bsp_compute_conditional_flags


function (visualgdb_bsp_load_referenced_frameworks)
    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.periph_legacy) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.spi_driver_legacy)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.spi_driver_legacy "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.spi_driver_legacy "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.spi_driver_legacy}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.swi_driver_legacy)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.swi_driver_legacy "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.swi_driver_legacy "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.swi_driver_legacy}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.twi_driver_legacy)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.twi_driver_legacy "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.twi_driver_legacy "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.twi_driver_legacy}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.clock_driver_legacy)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.clock_driver_legacy "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.clock_driver_legacy "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.clock_driver_legacy}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.uart_driver_legacy)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.uart_driver_legacy "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.uart_driver_legacy "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.uart_driver_legacy}" PARENT_SCOPE)
        endif()

    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.drivers_nrf) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.nrf_soc_nosd)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.nrf_soc_nosd "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.nrf_soc_nosd "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.nrf_soc_nosd}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.radio_config)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.radio_config "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.radio_config "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.radio_config}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.sdio)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.sdio "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.sdio "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.sdio}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.spi_master)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.spi_master "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.spi_master "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.spi_master}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.usbd)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.usbd "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.usbd "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.usbd}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.twi_master)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.twi_master "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.twi_master "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.twi_master}" PARENT_SCOPE)
        endif()

    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.drivers_ext) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.adns2080)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.adns2080 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.adns2080 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.adns2080}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.bh1745)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.bh1745 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.bh1745 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.bh1745}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ccs811)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ccs811 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ccs811 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ccs811}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.cherry8x16)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.cherry8x16 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.cherry8x16 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.cherry8x16}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ds1624)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ds1624 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ds1624 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ds1624}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.hts221)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.hts221 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.hts221 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.hts221}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ili9341)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ili9341 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ili9341 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ili9341}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lis2dh12)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lis2dh12 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lis2dh12 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lis2dh12}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lps22hb)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lps22hb "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lps22hb "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lps22hb}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.max9850)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.max9850 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.max9850 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.max9850}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mcp4725)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mcp4725 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mcp4725 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mcp4725}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mpu6050)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mpu6050 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mpu6050 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mpu6050}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.nrf6350)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.nrf6350 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.nrf6350 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.nrf6350}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.st7735)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.st7735 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.st7735 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.st7735}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.sx1509b)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.sx1509b "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.sx1509b "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.sx1509b}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.synaptics_touchpad)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.synaptics_touchpad "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.synaptics_touchpad "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.synaptics_touchpad}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.uda1380)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.uda1380 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.uda1380 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.uda1380}" PARENT_SCOPE)
        endif()

    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.boards) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_mode)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_mode "BSP_SIMPLE")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_mode "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_mode}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_uart)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_uart "BSP_UART_SUPPORT")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_uart "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_uart}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.type)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.type "PCA10040")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.type "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.type}" PARENT_SCOPE)
        endif()

    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.libraries) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader_dfu)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader_dfu "none")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader_dfu "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader_dfu}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_fifo)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_fifo "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_fifo "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_fifo}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_flags)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_flags "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_flags "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_flags}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.balloc)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.balloc "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.balloc "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.balloc}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.block_dev)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.block_dev "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.block_dev "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.block_dev}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bsp)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bsp "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bsp "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bsp}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.button)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.button "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.button "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.button}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.cli)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.cli "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.cli "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.cli}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc16)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc16 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc16 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc16}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc32)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc32 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc32 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc32}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crypto)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crypto "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crypto "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crypto}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense_drv)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense_drv "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense_drv "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense_drv}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.delay)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.delay "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.delay "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.delay}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ecc)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ecc "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ecc "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ecc}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_libuarte)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_libuarte "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_libuarte "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_libuarte}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_section_vars)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_section_vars "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_section_vars "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_section_vars}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_task_manager)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_task_manager "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_task_manager "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_task_manager}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fds)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fds "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fds "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fds}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fifo)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fifo "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fifo "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fifo}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fstorage)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fstorage "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fstorage "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fstorage}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gfx)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gfx "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gfx "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gfx}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gpiote)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gpiote "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gpiote "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gpiote}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hardfault)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hardfault "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hardfault "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hardfault}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hci)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hci "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hci "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hci}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.led_softblink)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.led_softblink "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.led_softblink "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.led_softblink}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.log)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.log "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.log "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.log}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.low_power_pwm)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.low_power_pwm "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.low_power_pwm "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.low_power_pwm}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.memobj)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.memobj "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.memobj "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.memobj}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mem_manager)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mem_manager "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mem_manager "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mem_manager}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mpu)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mpu "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mpu "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mpu}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mutex)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mutex "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mutex "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mutex}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwm)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwm "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwm "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwm}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwr_mgmt)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwr_mgmt "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwr_mgmt "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwr_mgmt}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.queue)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.queue "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.queue "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.queue}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ringbuf)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ringbuf "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ringbuf "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ringbuf}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sdcard)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sdcard "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sdcard "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sdcard}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sensorsim)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sensorsim "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sensorsim "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sensorsim}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.serial)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.serial "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.serial "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.serial}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sha256)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sha256 "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sha256 "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sha256}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.simple_timer)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.simple_timer "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.simple_timer "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.simple_timer}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.slip)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.slip "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.slip "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.slip}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sortlist)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sortlist "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sortlist "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sortlist}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.spi_mngr)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.spi_mngr "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.spi_mngr "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.spi_mngr}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_guard)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_guard "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_guard "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_guard}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_info)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_info "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_info "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_info}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.strerror)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.strerror "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.strerror "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.strerror}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.svc)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.svc "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.svc "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.svc}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_mngr)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_mngr "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_mngr "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_mngr}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_sensor)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_sensor "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_sensor "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_sensor}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.usbd)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.usbd "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.usbd "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.usbd}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.util)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.util "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.util "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.util}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.scheduler)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.scheduler "none")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.scheduler "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.scheduler}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.timer)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.timer "none")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.timer "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.timer}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.uart)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.uart "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.uart "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.uart}" PARENT_SCOPE)
        endif()

    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.mbedtls) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mbedtls.tls_interface)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mbedtls.tls_interface "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mbedtls.tls_interface "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mbedtls.tls_interface}" PARENT_SCOPE)
        endif()

    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.stack_heap) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.stacksize)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.stacksize "8192")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.stacksize "${BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.stacksize}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.heapsize)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.heapsize "8192")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.heapsize "${BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.heapsize}" PARENT_SCOPE)
        endif()

    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf51.freertos) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap "heap_4")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap "${BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap}" PARENT_SCOPE)
        endif()

        set(BSP_CONFIGURATION_com.sysprogs.rtos_type "com.sysprogs.freertos")
        set(BSP_CONFIGURATION_com.sysprogs.rtos_type "${BSP_CONFIGURATION_com.sysprogs.rtos_type}" PARENT_SCOPE)
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.iot) AND "${BSP_MCU}" MATCHES "^nRF.*")
        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.com.sysprogs.bspoptions.stackheap.tls_instance)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.com.sysprogs.bspoptions.stackheap.tls_instance "1")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.com.sysprogs.bspoptions.stackheap.tls_instance "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.com.sysprogs.bspoptions.stackheap.tls_instance}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.background_dfu)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.background_dfu "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.background_dfu "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.background_dfu}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ble_6lowpan)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ble_6lowpan "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ble_6lowpan "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ble_6lowpan}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.coap)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.coap "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.coap "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.coap}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.common)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.common "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.common "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.common}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.context_manager)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.context_manager "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.context_manager "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.context_manager}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.errno)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.errno "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.errno "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.errno}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_file)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_file "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_file "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_file}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_timer)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_timer "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_timer "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_timer}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_parse)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_parse "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_parse "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_parse}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_stack)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_stack "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_stack "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_stack}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.lwm2m)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.lwm2m "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.lwm2m "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.lwm2m}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.medium)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.medium "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.medium "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.medium}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.mqtt)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.mqtt "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.mqtt "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.mqtt}" PARENT_SCOPE)
        endif()

        if(NOT DEFINED BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.socket)
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.socket "")
            set(BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.socket "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.socket}" PARENT_SCOPE)
        endif()

    endif()

    set(_core_includes "${_core_includes}" PARENT_SCOPE)
    set(_core_defines "${_core_defines}" PARENT_SCOPE)
    set(_core_forced_includes "${_core_forced_includes}" PARENT_SCOPE)
    set(_framework_libraries "${_framework_libraries}" PARENT_SCOPE)
endfunction() #visualgdb_bsp_load_referenced_frameworks

function (visualgdb_bsp_instantiate_referenced_frameworks)
    set(_framework_libraries "")
    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.periph_legacy) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_power.c"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_rng.c"
            "${BSP_ROOT}/nRF5x/integration/nrfx/nrfx_config.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/nrfx_glue.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/nrfx_log.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/apply_old_config.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_common.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_comp.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_gpiote.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_i2s.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_lpcomp.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_pdm.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_power.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_ppi.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_pwm.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_qdec.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_qspi.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_rng.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_rtc.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_saadc.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_spi.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_spis.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_systick.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_timer.h"
            "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_wdt.h")
        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.clock_driver_legacy}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_clock.c" "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_clock.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.spi_driver_legacy}" STREQUAL "5W_master")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_spi.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.spi_driver_legacy}" STREQUAL "slave")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_spis.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.swi_driver_legacy}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_swi.c" "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_swi.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.twi_driver_legacy}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_twi.c" "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_twi.h" "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_twis.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.uart_driver_legacy}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_uart.c" "${BSP_ROOT}/nRF5x/integration/nrfx/legacy/nrf_drv_uart.h")
        endif()


        set(_includes "${BSP_ROOT}/nRF5x/integration/nrfx" "${BSP_ROOT}/nRF5x/integration/nrfx/legacy")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.periph_legacy" periph_legacy "Legacy Peripheral Drivers" "Legacy Peripheral Drivers")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.drivers_nrf) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/components/drivers_nrf/twi_master/deprecated/twi_master.h")
        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.nrf_soc_nosd}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/nrf_soc_nosd/nrf_nvic.c"
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/nrf_soc_nosd/nrf_soc.c"
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/nrf_soc_nosd/nrf_error.h"
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/nrf_soc_nosd/nrf_nvic.h"
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/nrf_soc_nosd/nrf_sdm.h"
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/nrf_soc_nosd/nrf_soc.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.radio_config}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_nrf/radio_config/radio_config.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.sdio}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_nrf/sdio/sdio.c" "${BSP_ROOT}/nRF5x/components/drivers_nrf/sdio/sdio.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.spi_master}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_nrf/spi_master/spi_5W_master.c" "${BSP_ROOT}/nRF5x/components/drivers_nrf/spi_master/spi_5W_master.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.twi_master}" STREQUAL "hw_master")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_nrf/twi_master/deprecated/twi_hw_master.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.twi_master}" STREQUAL "sw_master")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_nrf/twi_master/deprecated/twi_sw_master.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_nrf.usbd}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/usbd/nrf_drv_usbd.c"
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/usbd/nrf_drv_usbd.h"
                "${BSP_ROOT}/nRF5x/components/drivers_nrf/usbd/nrf_drv_usbd_errata.h")
        endif()


        set(_includes
            "${BSP_ROOT}/nRF5x/components/drivers_nrf/radio_config"
            "${BSP_ROOT}/nRF5x/components/drivers_nrf/sdio"
            "${BSP_ROOT}/nRF5x/components/drivers_nrf/sdio/config"
            "${BSP_ROOT}/nRF5x/components/drivers_nrf/spi_master"
            "${BSP_ROOT}/nRF5x/components/drivers_nrf/twi_master/deprecated"
            "${BSP_ROOT}/nRF5x/components/drivers_nrf/twi_master/deprecated/config"
            "${BSP_ROOT}/nRF5x/components/drivers_nrf/usbd")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.drivers_nrf" drivers_nrf "Peripheral Drivers (Old)" "Peripheral Drivers (Old)")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.drivers_ext) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources)
        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.adns2080}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/adns2080/adns2080.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/adns2080/adns2080.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.bh1745}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/bh1745/bh1745.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/bh1745/bh1745.h" "${BSP_ROOT}/nRF5x/components/drivers_ext/bh1745/bh1745_internal.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ccs811}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/ccs811/ccs811.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/ccs811/ccs811.h" "${BSP_ROOT}/nRF5x/components/drivers_ext/ccs811/ccs811_internal.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.cherry8x16}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/cherry8x16/cherry8x16.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/cherry8x16/cherry8x16.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ds1624}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/ds1624/ds1624.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/ds1624/ds1624.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.hts221}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/hts221/hts221.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/hts221/hts221.h" "${BSP_ROOT}/nRF5x/components/drivers_ext/hts221/hts221_internal.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.ili9341}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/ili9341/ili9341.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lis2dh12}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/drivers_ext/lis2dh12/lis2dh12.c"
                "${BSP_ROOT}/nRF5x/components/drivers_ext/lis2dh12/lis2dh12.h"
                "${BSP_ROOT}/nRF5x/components/drivers_ext/lis2dh12/lis2dh12_internal.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.lps22hb}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/drivers_ext/lps22hb/lps22hb.c"
                "${BSP_ROOT}/nRF5x/components/drivers_ext/lps22hb/lps22hb.h"
                "${BSP_ROOT}/nRF5x/components/drivers_ext/lps22hb/lps22hb_internal.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.max9850}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/max9850/max9850.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/max9850/max9850.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mcp4725}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/mcp4725/mcp4725.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/mcp4725/mcp4725.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.mpu6050}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/mpu6050/mpu6050.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/mpu6050/mpu6050.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.nrf6350}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/nrf6350/nrf6350.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/nrf6350/nrf6350.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.st7735}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/st7735/st7735.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.sx1509b}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/drivers_ext/sx1509b/sx1509b.c"
                "${BSP_ROOT}/nRF5x/components/drivers_ext/sx1509b/sx1509b.h"
                "${BSP_ROOT}/nRF5x/components/drivers_ext/sx1509b/sx1509b_internal.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.synaptics_touchpad}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/synaptics_touchpad/synaptics_touchpad.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/synaptics_touchpad/synaptics_touchpad.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.drivers_ext.uda1380}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/drivers_ext/uda1380/uda1380.c" "${BSP_ROOT}/nRF5x/components/drivers_ext/uda1380/uda1380.h")
        endif()


        set(_includes
            "${BSP_ROOT}/nRF5x/components/drivers_ext/adns2080"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/bh1745"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/ccs811"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/cherry8x16"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/ds1624"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/hts221"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/lis2dh12"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/lps22hb"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/max9850"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/mcp4725"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/mpu6050"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/nrf6350"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/sx1509b"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/synaptics_touchpad"
            "${BSP_ROOT}/nRF5x/components/drivers_ext/uda1380")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.drivers_ext" drivers_ext "External Device Drivers" "External Peripherals")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.util) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources)
        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.util}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_error.c"
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_error_handler_gcc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_error_weak.c"
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_util_platform.c"
                "${BSP_ROOT}/nRF5x/components/libraries/util/nrf_assert.c"
                "${BSP_ROOT}/nRF5x/components/libraries/util/sdk_mapped_flags.c"
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_error.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_error_weak.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_util.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_util_bds.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/app_util_platform.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/nordic_common.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/nrf_assert.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/nrf_bitmask.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/sdk_alloca.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/sdk_common.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/sdk_errors.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/sdk_macros.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/sdk_mapped_flags.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/sdk_os.h"
                "${BSP_ROOT}/nRF5x/components/libraries/util/sdk_resources.h")
        endif()


        set(_includes "${BSP_ROOT}/nRF5x/components/libraries/util")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.util" util "NRF5x Common Utilities" "Utils")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.peerm) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/auth_status_tracker.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/gatts_cache_manager.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/gatt_cache_manager.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/id_manager.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/nrf_ble_lesc.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_database.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_data_storage.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_id.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_manager.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_manager_handler.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/pm_buffer.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/security_dispatcher.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/security_manager.c"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/auth_status_tracker.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/gatts_cache_manager.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/gatt_cache_manager.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/id_manager.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/nrf_ble_lesc.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_database.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_data_storage.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_id.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_manager.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_manager_handler.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_manager_internal.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/peer_manager_types.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/pm_buffer.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/security_dispatcher.h"
            "${BSP_ROOT}/nRF5x/components/ble/peer_manager/security_manager.h")
        set(_includes "${BSP_ROOT}/nRF5x/components/ble/peer_manager")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.peerm" peerm "Peer manager" "Peer Manager")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.gatt) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/components/ble/nrf_ble_gatt/nrf_ble_gatt.c" "${BSP_ROOT}/nRF5x/components/ble/nrf_ble_gatt/nrf_ble_gatt.h")
        set(_includes "${BSP_ROOT}/nRF5x/components/ble/nrf_ble_gatt")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.gatt" gatt "GATT" "GATT")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.boards) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/components/boards/boards.c"
            "${BSP_ROOT}/nRF5x/components/boards/arduino_primo.h"
            "${BSP_ROOT}/nRF5x/components/boards/boards.h"
            "${BSP_ROOT}/nRF5x/components/boards/d52_starterkit.h"
            "${BSP_ROOT}/nRF5x/components/boards/n5_starterkit.h"
            "${BSP_ROOT}/nRF5x/components/boards/nrf6310.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10000.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10001.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10003.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10028.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10031.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10036.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10040.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10056.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca10059.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca20006.h"
            "${BSP_ROOT}/nRF5x/components/boards/pca20020.h"
            "${BSP_ROOT}/nRF5x/components/boards/wt51822.h")
        set(_includes "${BSP_ROOT}/nRF5x/components/boards")
        set(_defines
            "BOARD_${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.type}"
            "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_mode}"
            "${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.board.bsp_uart}")
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.boards" boards "NRF5x Evaluation Board Support" "Boards")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.libraries) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/external/fprintf/nrf_fprintf.c"
            "${BSP_ROOT}/nRF5x/external/fprintf/nrf_fprintf_format.c"
            "${BSP_ROOT}/nRF5x/external/fprintf/nrf_fprintf.h"
            "${BSP_ROOT}/nRF5x/external/fprintf/nrf_fprintf_format.h")
        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/atomic/nrf_atomic.c"
                "${BSP_ROOT}/nRF5x/components/libraries/atomic/nrf_atomic.h"
                "${BSP_ROOT}/nRF5x/components/libraries/atomic/nrf_atomic_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/atomic/nrf_atomic_sanity_check.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_fifo}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/atomic_fifo/nrf_atfifo.c"
                "${BSP_ROOT}/nRF5x/components/libraries/atomic_fifo/nrf_atfifo.h"
                "${BSP_ROOT}/nRF5x/components/libraries/atomic_fifo/nrf_atfifo_internal.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.atomic_flags}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/atomic_flags/nrf_atflags.c" "${BSP_ROOT}/nRF5x/components/libraries/atomic_flags/nrf_atflags.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.balloc}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/balloc/nrf_balloc.c" "${BSP_ROOT}/nRF5x/components/libraries/balloc/nrf_balloc.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.block_dev}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/empty/nrf_block_dev_empty.c"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/qspi/nrf_block_dev_qspi.c"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/qspi/nrf_serial_flash_params.c"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/ram/nrf_block_dev_ram.c"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/sdc/nrf_block_dev_sdc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/nrf_block_dev.h"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/empty/nrf_block_dev_empty.h"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/qspi/nrf_block_dev_qspi.h"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/qspi/nrf_serial_flash_params.h"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/ram/nrf_block_dev_ram.h"
                "${BSP_ROOT}/nRF5x/components/libraries/block_dev/sdc/nrf_block_dev_sdc.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bootloader}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_app_start.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_app_start_final.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_dfu_timers.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_fw_activation.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_info.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_wdt.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/ble_dfu/nrf_dfu_ble.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/dfu-cc.options"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/dfu-cc.pb.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/dfu-cc.proto"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_flash.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_handling_error.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_mbr.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_req_handler.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_settings.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_settings_svci.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_svci.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_svci_handler.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_transport.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_trigger_usb.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_utils.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_validation.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_ver_validation.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/serial_dfu/nrf_dfu_serial.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/serial_dfu/nrf_dfu_serial_uart.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/serial_dfu/nrf_dfu_serial_usb.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_app_start.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_dfu_timers.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_fw_activation.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_info.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/nrf_bootloader_wdt.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/ble_dfu/nrf_dfu_ble.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/ble_dfu/nrf_dfu_ble_svci_bond_sharing.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/dfu-cc.pb.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_flash.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_handling_error.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_mbr.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_req_handler.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_settings.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_transport.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_trigger_usb.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_utils.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_validation.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu/nrf_dfu_ver_validation.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bootloader/serial_dfu/nrf_dfu_serial.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.bsp}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_btn_ant.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_btn_ble.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_cli.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_nfc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_btn_ant.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_btn_ble.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_cli.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_config.h"
                "${BSP_ROOT}/nRF5x/components/libraries/bsp/bsp_nfc.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.button}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/button/app_button.c" "${BSP_ROOT}/nRF5x/components/libraries/button/app_button.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.cli}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/cli/cli_utils_cmds.c"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/nrf_cli.c"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/ble_uart/nrf_cli_ble_uart.c"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/cdc_acm/nrf_cli_cdc_acm.c"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/libuarte/nrf_cli_libuarte.c"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/rtt/nrf_cli_rtt.c"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/uart/nrf_cli_uart.c"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/nrf_cli.h"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/nrf_cli_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/nrf_cli_vt100.h"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/ble_uart/nrf_cli_ble_uart.h"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/cdc_acm/nrf_cli_cdc_acm.h"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/libuarte/nrf_cli_libuarte.h"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/rtt/nrf_cli_rtt.h"
                "${BSP_ROOT}/nRF5x/components/libraries/cli/uart/nrf_cli_uart.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc16}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/crc16/crc16.c" "${BSP_ROOT}/nRF5x/components/libraries/crc16/crc16.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crc32}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/crc32/crc32.c" "${BSP_ROOT}/nRF5x/components/libraries/crc32/crc32.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.crypto}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aead.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aes.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aes_shared.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecdh.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecdsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_eddsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_error.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hash.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hkdf.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hmac.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_init.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_rng.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_shared.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_aes.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_aes_aead.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_chacha_poly_aead.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_ecc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_ecdh.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_ecdsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_eddsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_hash.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_hmac.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_init.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_mutex.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_rng.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_shared.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_ecc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_ecdsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_hash.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_init.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_shared.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cifra/cifra_backend_aes_aead.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_aes.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_aes_aead.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_ecc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_ecdh.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_ecdsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_hash.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_hmac.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_init.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecdh.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecdsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_hw/nrf_hw_backend_init.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_hw/nrf_hw_backend_rng.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_hw/nrf_hw_backend_rng_mbedtls.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_sw/nrf_sw_backend_hash.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_chacha_poly_aead.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_ecc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_ecdh.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_ecdsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_eddsa.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_hash.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_hmac.c"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aead.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aead_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aead_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aes.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aes_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_aes_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecc_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecc_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecdh.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecdh_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecdh_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecdsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecdsa_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_ecdsa_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_eddsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_eddsa_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_eddsa_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_error.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hash.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hash_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hash_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hkdf.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hmac.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hmac_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_hmac_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_init.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_mem.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_rng.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_rng_backend.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_rng_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/nrf_crypto_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_aes.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_aes_aead.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_chacha_poly_aead.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_ecc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_ecdh.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_ecdsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_eddsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_hash.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_hmac.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_mutex.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_rng.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310/cc310_backend_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_ecc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_ecdh.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_ecdsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_hash.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cifra/cifra_backend_aes_aead.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_aes.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_aes_aead.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_ecc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_ecdh.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_ecdsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_hash.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls/mbedtls_backend_hmac.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecdh.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecdsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_shared.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_hw/nrf_hw_backend_rng.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_hw/nrf_hw_backend_rng_mbedtls.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_sw/nrf_sw_backend_hash.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_chacha_poly_aead.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_ecc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_ecdh.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_ecdsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_eddsa.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_hash.h"
                "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon/oberon_backend_hmac.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/csense/nrf_csense.c"
                "${BSP_ROOT}/nRF5x/components/libraries/csense/nrf_csense.h"
                "${BSP_ROOT}/nRF5x/components/libraries/csense/nrf_csense_macros.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.csense_drv}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/csense_drv/nrf_drv_csense.c" "${BSP_ROOT}/nRF5x/components/libraries/csense_drv/nrf_drv_csense.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ecc}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/ecc/ecc.c" "${BSP_ROOT}/nRF5x/components/libraries/ecc/ecc.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_libuarte}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_libuarte/nrf_libuarte.c"
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_libuarte/nrf_libuarte_async.c"
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_libuarte/nrf_libuarte.h"
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_libuarte/nrf_libuarte_async.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_section_vars}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_section_vars/nrf_section_iter.c"
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_section_vars/nrf_section.h"
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_section_vars/nrf_section_iter.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.experimental_task_manager}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_task_manager/task_manager.c"
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_task_manager/task_manager_core_armgcc.S"
                "${BSP_ROOT}/nRF5x/components/libraries/experimental_task_manager/task_manager.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fds}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/fds/fds.c" "${BSP_ROOT}/nRF5x/components/libraries/fds/fds.h" "${BSP_ROOT}/nRF5x/components/libraries/fds/fds_internal_defs.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fifo}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/fifo/app_fifo.c" "${BSP_ROOT}/nRF5x/components/libraries/fifo/app_fifo.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.fstorage}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/fstorage/nrf_fstorage.c"
                "${BSP_ROOT}/nRF5x/components/libraries/fstorage/nrf_fstorage_nvmc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/fstorage/nrf_fstorage_sd.c"
                "${BSP_ROOT}/nRF5x/components/libraries/fstorage/nrf_fstorage.h"
                "${BSP_ROOT}/nRF5x/components/libraries/fstorage/nrf_fstorage_nvmc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/fstorage/nrf_fstorage_sd.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gfx}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/gfx/nrf_gfx.c" "${BSP_ROOT}/nRF5x/components/libraries/gfx/nrf_gfx.h" "${BSP_ROOT}/nRF5x/components/libraries/gfx/nrf_lcd.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.gpiote}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/gpiote/app_gpiote.c" "${BSP_ROOT}/nRF5x/components/libraries/gpiote/app_gpiote.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hardfault}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/hardfault/hardfault_implementation.c"
                "${BSP_ROOT}/nRF5x/components/libraries/hardfault/hardfault.h"
                "${BSP_ROOT}/nRF5x/components/libraries/hardfault/hardfault_genhf.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.hci}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/hci/hci_mem_pool.c"
                "${BSP_ROOT}/nRF5x/components/libraries/hci/hci_slip.c"
                "${BSP_ROOT}/nRF5x/components/libraries/hci/hci_transport.c"
                "${BSP_ROOT}/nRF5x/components/libraries/hci/hci_mem_pool.h"
                "${BSP_ROOT}/nRF5x/components/libraries/hci/hci_slip.h"
                "${BSP_ROOT}/nRF5x/components/libraries/hci/hci_transport.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.led_softblink}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/led_softblink/led_softblink.c" "${BSP_ROOT}/nRF5x/components/libraries/led_softblink/led_softblink.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.log}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_backend_flash.c"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_backend_rtt.c"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_backend_serial.c"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_backend_uart.c"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_default_backends.c"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_frontend.c"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_str_formatter.c"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_backend_flash.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_backend_interface.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_backend_rtt.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_backend_uart.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_ctrl.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_default_backends.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_instance.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_str_formatter.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/nrf_log_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_backend_serial.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_ctrl_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/log/src/nrf_log_internal.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.low_power_pwm}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/low_power_pwm/low_power_pwm.c" "${BSP_ROOT}/nRF5x/components/libraries/low_power_pwm/low_power_pwm.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.memobj}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/memobj/nrf_memobj.c" "${BSP_ROOT}/nRF5x/components/libraries/memobj/nrf_memobj.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mem_manager}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/mem_manager/mem_manager.c" "${BSP_ROOT}/nRF5x/components/libraries/mem_manager/mem_manager.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mpu}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/mpu/nrf_mpu.c" "${BSP_ROOT}/nRF5x/components/libraries/mpu/nrf_mpu.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwm}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/pwm/app_pwm.c" "${BSP_ROOT}/nRF5x/components/libraries/pwm/app_pwm.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.pwr_mgmt}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/pwr_mgmt/nrf_pwr_mgmt.c" "${BSP_ROOT}/nRF5x/components/libraries/pwr_mgmt/nrf_pwr_mgmt.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.queue}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/queue/nrf_queue.c" "${BSP_ROOT}/nRF5x/components/libraries/queue/nrf_queue.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.ringbuf}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/ringbuf/nrf_ringbuf.c" "${BSP_ROOT}/nRF5x/components/libraries/ringbuf/nrf_ringbuf.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.scheduler}" STREQUAL "normal")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/scheduler/app_scheduler.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.scheduler}" STREQUAL "serconn")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/scheduler/app_scheduler_serconn.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sdcard}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/sdcard/app_sdcard.c" "${BSP_ROOT}/nRF5x/components/libraries/sdcard/app_sdcard.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sensorsim}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/sensorsim/sensorsim.c" "${BSP_ROOT}/nRF5x/components/libraries/sensorsim/sensorsim.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.serial}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/serial/nrf_serial.c" "${BSP_ROOT}/nRF5x/components/libraries/serial/nrf_serial.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sha256}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/sha256/sha256.c" "${BSP_ROOT}/nRF5x/components/libraries/sha256/sha256.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.simple_timer}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/simple_timer/app_simple_timer.c" "${BSP_ROOT}/nRF5x/components/libraries/simple_timer/app_simple_timer.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.slip}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/slip/slip.c" "${BSP_ROOT}/nRF5x/components/libraries/slip/slip.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.sortlist}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/sortlist/nrf_sortlist.c" "${BSP_ROOT}/nRF5x/components/libraries/sortlist/nrf_sortlist.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.spi_mngr}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/spi_mngr/nrf_spi_mngr.c" "${BSP_ROOT}/nRF5x/components/libraries/spi_mngr/nrf_spi_mngr.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_guard}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/stack_guard/nrf_stack_guard.c" "${BSP_ROOT}/nRF5x/components/libraries/stack_guard/nrf_stack_guard.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.strerror}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/strerror/nrf_strerror.c" "${BSP_ROOT}/nRF5x/components/libraries/strerror/nrf_strerror.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.svc}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/svc/nrf_svc_handler.c"
                "${BSP_ROOT}/nRF5x/components/libraries/svc/nrf_svci.h"
                "${BSP_ROOT}/nRF5x/components/libraries/svc/nrf_svci_async_function.h"
                "${BSP_ROOT}/nRF5x/components/libraries/svc/nrf_svci_async_handler.h"
                "${BSP_ROOT}/nRF5x/components/libraries/svc/nrf_svc_function.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.timer}" STREQUAL "normal")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/timer/app_timer.c" "${BSP_ROOT}/nRF5x/components/libraries/timer/app_timer.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.timer}" STREQUAL "freertos")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/timer/app_timer_freertos.c" "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh_freertos.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.timer}" STREQUAL "rtx")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/timer/app_timer_rtx.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_mngr}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/twi_mngr/nrf_twi_mngr.c" "${BSP_ROOT}/nRF5x/components/libraries/twi_mngr/nrf_twi_mngr.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.twi_sensor}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/twi_sensor/nrf_twi_sensor.c" "${BSP_ROOT}/nRF5x/components/libraries/twi_sensor/nrf_twi_sensor.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.uart}" STREQUAL "app_uart")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/uart/app_uart.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.uart}" STREQUAL "app_uart_fifo")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/uart/app_uart_fifo.c")
        endif()


        if(NOT ("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.uart}" STREQUAL ""))
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/uart/retarget.c" "${BSP_ROOT}/nRF5x/components/libraries/uart/app_uart.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.usbd}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_core.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_serial_num.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_string_desc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/audio/app_usbd_audio.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/cdc/acm/app_usbd_cdc_acm.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/dummy/app_usbd_dummy.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/app_usbd_hid.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/generic/app_usbd_hid_generic.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/kbd/app_usbd_hid_kbd.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/mouse/app_usbd_hid_mouse.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/msc/app_usbd_msc.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/nrf_dfu_trigger/app_usbd_nrf_dfu_trigger.c"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_class_base.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_core.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_descriptor.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_langid.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_request.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_serial_num.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_string_desc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/app_usbd_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/audio/app_usbd_audio.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/audio/app_usbd_audio_desc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/audio/app_usbd_audio_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/audio/app_usbd_audio_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/cdc/app_usbd_cdc_desc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/cdc/app_usbd_cdc_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/cdc/acm/app_usbd_cdc_acm.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/cdc/acm/app_usbd_cdc_acm_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/dummy/app_usbd_dummy.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/dummy/app_usbd_dummy_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/dummy/app_usbd_dummy_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/app_usbd_hid.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/app_usbd_hid_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/generic/app_usbd_hid_generic.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/generic/app_usbd_hid_generic_desc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/generic/app_usbd_hid_generic_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/kbd/app_usbd_hid_kbd.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/kbd/app_usbd_hid_kbd_desc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/kbd/app_usbd_hid_kbd_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/mouse/app_usbd_hid_mouse.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/mouse/app_usbd_hid_mouse_desc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/mouse/app_usbd_hid_mouse_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/msc/app_usbd_msc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/msc/app_usbd_msc_desc.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/msc/app_usbd_msc_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/msc/app_usbd_msc_scsi.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/msc/app_usbd_msc_types.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/nrf_dfu_trigger/app_usbd_nrf_dfu_trigger.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/nrf_dfu_trigger/app_usbd_nrf_dfu_trigger_internal.h"
                "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/nrf_dfu_trigger/app_usbd_nrf_dfu_trigger_types.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.nrf_cc310}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/external/nrf_cc310/lib/libnrf_cc310_0.9.10.a")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.nrf_cc310_bl}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/lib/libnrf_cc310_bl_0.9.10.a"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/lib/libnrf_cc310_bl_short_wchar_0.9.10.a"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/lib/license.txt"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/crys_aesccm.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/crys_error.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/crys_rnd.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/crys_rnd_error.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/nrf_cc310_bl.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/nrf_cc310_bl_ecdsa_verify_common.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/nrf_cc310_bl_ecdsa_verify_secp224r1.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/nrf_cc310_bl_ecdsa_verify_secp256r1.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/nrf_cc310_bl_hash_common.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/nrf_cc310_bl_hash_sha256.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/nrf_cc310_bl_init.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/ssi_aes.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/ssi_aes_defs.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/ssi_aes_error.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/ssi_pal_types.h"
                "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include/ssi_pal_types_plat.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.nrf_oberon}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/lib/nrf52/liboberon_2.0.5.a"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_chacha20.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_chacha20_poly1305.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_constant_time.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_curve25519.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_curve_p256.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_ecdh_p256.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_ecdsa_p256.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_ed25519.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_hkdf_sha256.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_hkdf_sha512.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_hmac_sha256.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_hmac_sha512.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_poly1305.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_rsa.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_rsa_key.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_sha1.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_sha256.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_sha512.h"
                "${BSP_ROOT}/nRF5x/external/nrf_oberon/include/occ_srp.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.segger_rtt}" STREQUAL "1")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/external/segger_rtt/SEGGER_RTT.c"
                "${BSP_ROOT}/nRF5x/external/segger_rtt/SEGGER_RTT_printf.c"
                "${BSP_ROOT}/nRF5x/external/segger_rtt/SEGGER_RTT_Syscalls_GCC.c"
                "${BSP_ROOT}/nRF5x/external/segger_rtt/SEGGER_RTT_Syscalls_SES.c"
                "${BSP_ROOT}/nRF5x/external/segger_rtt/license/license.txt"
                "${BSP_ROOT}/nRF5x/external/segger_rtt/SEGGER_RTT.h"
                "${BSP_ROOT}/nRF5x/external/segger_rtt/SEGGER_RTT_Conf.h")
        endif()


        if(NOT ("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.softdevice}" STREQUAL "nosoftdev"))
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh.c"
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh_ant.c"
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh_ble.c"
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh_soc.c"
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh.h"
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh_ant.h"
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh_ble.h"
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh_freertos.h"
                "${BSP_ROOT}/nRF5x/components/softdevice/common/nrf_sdh_soc.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.delay}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/delay/nrf_delay.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.mutex}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/mutex/nrf_mtx.h")
        endif()


        if(NOT ("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.scheduler}" STREQUAL "none"))
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/scheduler/app_scheduler.h")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.stack_info}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/libraries/stack_info/nrf_stack_info.h")
        endif()


        set(_includes
            "${BSP_ROOT}/nRF5x/components/libraries/atomic"
            "${BSP_ROOT}/nRF5x/components/libraries/atomic_fifo"
            "${BSP_ROOT}/nRF5x/components/libraries/atomic_flags"
            "${BSP_ROOT}/nRF5x/components/libraries/balloc"
            "${BSP_ROOT}/nRF5x/components/libraries/block_dev"
            "${BSP_ROOT}/nRF5x/components/libraries/block_dev/empty"
            "${BSP_ROOT}/nRF5x/components/libraries/block_dev/qspi"
            "${BSP_ROOT}/nRF5x/components/libraries/block_dev/ram"
            "${BSP_ROOT}/nRF5x/components/libraries/block_dev/sdc"
            "${BSP_ROOT}/nRF5x/components/libraries/bootloader"
            "${BSP_ROOT}/nRF5x/components/libraries/bootloader/ble_dfu"
            "${BSP_ROOT}/nRF5x/components/libraries/bootloader/dfu"
            "${BSP_ROOT}/nRF5x/components/libraries/bootloader/serial_dfu"
            "${BSP_ROOT}/nRF5x/components/libraries/bsp"
            "${BSP_ROOT}/nRF5x/components/libraries/button"
            "${BSP_ROOT}/nRF5x/components/libraries/cli"
            "${BSP_ROOT}/nRF5x/components/libraries/cli/ble_uart"
            "${BSP_ROOT}/nRF5x/components/libraries/cli/cdc_acm"
            "${BSP_ROOT}/nRF5x/components/libraries/cli/libuarte"
            "${BSP_ROOT}/nRF5x/components/libraries/cli/rtt"
            "${BSP_ROOT}/nRF5x/components/libraries/cli/uart"
            "${BSP_ROOT}/nRF5x/components/libraries/crc16"
            "${BSP_ROOT}/nRF5x/components/libraries/crc32"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cc310_bl"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/cifra"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/mbedtls"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/micro_ecc"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_hw"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/nrf_sw"
            "${BSP_ROOT}/nRF5x/components/libraries/crypto/backend/oberon"
            "${BSP_ROOT}/nRF5x/components/libraries/csense"
            "${BSP_ROOT}/nRF5x/components/libraries/csense_drv"
            "${BSP_ROOT}/nRF5x/components/libraries/delay"
            "${BSP_ROOT}/nRF5x/components/libraries/ecc"
            "${BSP_ROOT}/nRF5x/components/libraries/experimental_libuarte"
            "${BSP_ROOT}/nRF5x/components/libraries/experimental_section_vars"
            "${BSP_ROOT}/nRF5x/components/libraries/experimental_task_manager"
            "${BSP_ROOT}/nRF5x/components/libraries/fds"
            "${BSP_ROOT}/nRF5x/components/libraries/fifo"
            "${BSP_ROOT}/nRF5x/components/libraries/fstorage"
            "${BSP_ROOT}/nRF5x/components/libraries/gfx"
            "${BSP_ROOT}/nRF5x/components/libraries/gpiote"
            "${BSP_ROOT}/nRF5x/components/libraries/hardfault"
            "${BSP_ROOT}/nRF5x/components/libraries/hci"
            "${BSP_ROOT}/nRF5x/components/libraries/led_softblink"
            "${BSP_ROOT}/nRF5x/components/libraries/log"
            "${BSP_ROOT}/nRF5x/components/libraries/log/src"
            "${BSP_ROOT}/nRF5x/components/libraries/low_power_pwm"
            "${BSP_ROOT}/nRF5x/components/libraries/memobj"
            "${BSP_ROOT}/nRF5x/components/libraries/mem_manager"
            "${BSP_ROOT}/nRF5x/components/libraries/mpu"
            "${BSP_ROOT}/nRF5x/components/libraries/mutex"
            "${BSP_ROOT}/nRF5x/components/libraries/pwm"
            "${BSP_ROOT}/nRF5x/components/libraries/pwr_mgmt"
            "${BSP_ROOT}/nRF5x/components/libraries/queue"
            "${BSP_ROOT}/nRF5x/components/libraries/ringbuf"
            "${BSP_ROOT}/nRF5x/components/libraries/scheduler"
            "${BSP_ROOT}/nRF5x/components/libraries/sdcard"
            "${BSP_ROOT}/nRF5x/components/libraries/sensorsim"
            "${BSP_ROOT}/nRF5x/components/libraries/serial"
            "${BSP_ROOT}/nRF5x/components/libraries/sha256"
            "${BSP_ROOT}/nRF5x/components/libraries/simple_timer"
            "${BSP_ROOT}/nRF5x/components/libraries/slip"
            "${BSP_ROOT}/nRF5x/components/libraries/sortlist"
            "${BSP_ROOT}/nRF5x/components/libraries/spi_mngr"
            "${BSP_ROOT}/nRF5x/components/libraries/stack_guard"
            "${BSP_ROOT}/nRF5x/components/libraries/stack_info"
            "${BSP_ROOT}/nRF5x/components/libraries/strerror"
            "${BSP_ROOT}/nRF5x/components/libraries/svc"
            "${BSP_ROOT}/nRF5x/components/libraries/timer"
            "${BSP_ROOT}/nRF5x/components/libraries/timer/experimental"
            "${BSP_ROOT}/nRF5x/components/libraries/twi_mngr"
            "${BSP_ROOT}/nRF5x/components/libraries/twi_sensor"
            "${BSP_ROOT}/nRF5x/components/libraries/uart"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/audio"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/cdc"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/cdc/acm"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/dummy"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/generic"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/kbd"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/hid/mouse"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/msc"
            "${BSP_ROOT}/nRF5x/components/libraries/usbd/class/nrf_dfu_trigger"
            "${BSP_ROOT}/nRF5x/components/libraries/util"
            "${BSP_ROOT}/nRF5x/external/fprintf"
            "${BSP_ROOT}/nRF5x/external/nrf_cc310/common"
            "${BSP_ROOT}/nRF5x/external/nrf_cc310/include"
            "${BSP_ROOT}/nRF5x/external/nrf_cc310/lib"
            "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/include"
            "${BSP_ROOT}/nRF5x/external/nrf_cc310_bl/lib"
            "${BSP_ROOT}/nRF5x/external/nrf_oberon/include"
            "${BSP_ROOT}/nRF5x/external/segger_rtt"
            "${BSP_ROOT}/nRF5x/external/segger_rtt/license"
            "${BSP_ROOT}/nRF5x/components/softdevice/common")
        set(_defines "NRF_LOG_BACKEND_SERIAL_USES_RTT=${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.libraries.segger_rtt}")
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.libraries" libraries "NRF5x Libraries" "Libraries")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf51.ble_common OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_common) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_advdata.c"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_conn_params.c"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_conn_state.c"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_srv_common.c"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_advdata.h"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_conn_params.h"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_conn_state.h"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_date_time.h"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_gatt_db.h"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_sensor_location.h"
            "${BSP_ROOT}/nRF5x/components/ble/common/ble_srv_common.h")
        set(_includes "${BSP_ROOT}/nRF5x/components/ble/common")
        set(_defines "BLE_STACK_SUPPORT_REQD")
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf51.ble_common" ble_common "Bluetooth LE - Common Files" "BLE Common")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.modules_nrfx) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_adc.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_clock.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_comp.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_gpiote.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_i2s.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_lpcomp.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_pdm.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_power.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_power_clock.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_ppi.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_pwm.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_qdec.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_qspi.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_rng.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_rtc.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_saadc.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_spi.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_spim.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_spis.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_swi.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_systick.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_timer.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_twi.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_twim.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_twis.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_uart.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_uarte.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/nrfx_wdt.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/prs/nrfx_prs.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_ecb.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_nvmc.c"
            "${BSP_ROOT}/nRF5x/modules/nrfx/nrfx.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/nrfx_common.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/nrfx_errors.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_adc.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_clock.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_comp.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_gpiote.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_i2s.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_lpcomp.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_pdm.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_power.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_power_clock.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_ppi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_pwm.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_qdec.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_qspi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_rng.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_rtc.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_saadc.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_spi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_spim.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_spis.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_swi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_systick.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_timer.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_twi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_twim.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_twis.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_uart.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_uarte.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrfx_wdt.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include/nrf_bitmask.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/prs/nrfx_prs.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_adc.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_ccm.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_clock.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_comp.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_ecb.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_egu.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_gpio.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_gpiote.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_i2s.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_lpcomp.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_nvmc.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_pdm.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_power.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_ppi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_pwm.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_qdec.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_qspi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_radio.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_rng.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_rtc.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_saadc.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_spi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_spim.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_spis.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_systick.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_temp.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_timer.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_twi.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_twim.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_twis.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_uart.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_uarte.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_usbd.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal/nrf_wdt.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/compiler_abstraction.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51422_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51801_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51802_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51822_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51824_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51_bitfields.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51_deprecated.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51_to_nrf52.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51_to_nrf52810.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf51_to_nrf52840.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52810.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52810_bitfields.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52810_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52832_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52840.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52840_bitfields.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52840_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52_bitfields.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52_name_change.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52_to_nrf52810.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf52_to_nrf52840.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/nrf_peripherals.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk/startup_config.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/soc/nrfx_coredep.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/soc/nrfx_irqs.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/soc/nrfx_irqs_nrf51.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/soc/nrfx_irqs_nrf52810.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/soc/nrfx_irqs_nrf52832.h"
            "${BSP_ROOT}/nRF5x/modules/nrfx/soc/nrfx_irqs_nrf52840.h")
        set(_includes
            "${BSP_ROOT}/nRF5x/modules/nrfx"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/include"
            "${BSP_ROOT}/nRF5x/modules/nrfx/drivers/src/prs"
            "${BSP_ROOT}/nRF5x/modules/nrfx/hal"
            "${BSP_ROOT}/nRF5x/modules/nrfx/mdk"
            "${BSP_ROOT}/nRF5x/modules/nrfx/soc")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.modules_nrfx" modules_nrfx "Peripheral Drivers" "Peripheral Drivers")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.lwip) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/def.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/dhcp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/dns.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/inet_chksum.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/init.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ip.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/memp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/netif.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/pbuf.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/raw.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/stats.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/sys.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/tcp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/tcp_in.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/tcp_out.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/timeouts.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/udp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/autoip.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/dhcp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/etharp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/icmp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/igmp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/ip4.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/ip4_addr.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/ip4_frag.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv4/ip_frag.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/dhcp6.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/ethip6.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/icmp6.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/inet6.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/ip6.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/ip6_addr.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/ip6_frag.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/mld6.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/core/ipv6/nd6.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/netif/etharp.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/netif/ethernet.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/netif/ethernetif.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/netif/lowpan6.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/netif/slipif.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/port/nrf_platform_port.c"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/api.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/api_msg.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/arch.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/autoip.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/debug.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/def.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/dhcp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/dhcp6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/dns.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/err.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/errno.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/etharp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ethip6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/icmp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/icmp6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/igmp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/inet.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/inet6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/inet_chksum.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/init.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip4.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip4_addr.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip4_frag.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip6_addr.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip6_frag.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip_addr.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/ip_frag.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/mem.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/memp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/memp_std.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/mld6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/nd6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/netbuf.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/netdb.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/netif.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/netifapi.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/opt.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/pbuf.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/pppapi.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/raw.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/sio.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/snmp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/snmp_asn1.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/snmp_msg.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/snmp_structs.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/sockets.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/stats.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/sys.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/tcp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/tcpip.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/timeouts.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/timers.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/udp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/priv/api_msg.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/priv/memp_priv.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/priv/memp_std.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/priv/nd6_priv.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/priv/tcpip_priv.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/priv/tcp_priv.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/autoip.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/dhcp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/dns.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/etharp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/ethernet.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/icmp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/icmp6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/igmp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/ip.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/ip4.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/ip6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/mld6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/nd6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/tcp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot/udp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/etharp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ethernet.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/lowpan6.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/lowpan6_opts.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/slipif.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/ccp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/chap-md5.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/chap-new.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/chap_ms.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/eap.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/ecp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/eui64.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/fsm.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/ipcp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/ipv6cp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/lcp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/magic.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/mppe.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/ppp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/pppapi.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/pppcrypt.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/pppdebug.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/pppoe.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/pppol2tp.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/pppos.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/ppp_impl.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/ppp_opts.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/upap.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/vj.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/polarssl/arc4.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/polarssl/des.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/polarssl/md4.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/polarssl/md5.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/polarssl/sha1.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/posix/errno.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/posix/netdb.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/posix/sys/socket.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/port/nrf_platform_port.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/port/arch/cc.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/port/arch/lwipopts.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/port/arch/perf.h"
            "${BSP_ROOT}/nRF5x/external/lwip/src/port/arch/sys_arch.h")
        set(_includes
            "${BSP_ROOT}/nRF5x/external/lwip/src/apps/httpd"
            "${BSP_ROOT}/nRF5x/external/lwip/src/apps/snmp"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/priv"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/lwip/prot"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/netif/ppp/polarssl"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/posix"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include/posix/sys"
            "${BSP_ROOT}/nRF5x/external/lwip/src/port"
            "${BSP_ROOT}/nRF5x/external/lwip/src/port/arch"
            "${BSP_ROOT}/nRF5x/external/lwip/src/include")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.lwip" lwip "NRF5x LWIP" "LwIP")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.mbedtls) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/aes.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/aesni.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/arc4.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/asn1parse.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/asn1write.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/base64.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/bignum.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/blowfish.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/camellia.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ccm.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/certs.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/cipher.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/cipher_wrap.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/cmac.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ctr_drbg.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/debug.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/des.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/dhm.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ecdh.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ecdsa.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ecjpake.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ecp.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ecp_curves.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/entropy.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/entropy_poll.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/error.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/gcm.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/havege.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/hmac_drbg.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/md.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/md2.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/md4.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/md5.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/md_wrap.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/memory_buffer_alloc.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/net_sockets.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/oid.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/padlock.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/pem.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/pk.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/pkcs11.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/pkcs12.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/pkcs5.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/pkparse.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/pkwrite.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/pk_wrap.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/platform.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ripemd160.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/rsa.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/sha1.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/sha256.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/sha512.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ssl_cache.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ssl_ciphersuites.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ssl_cli.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ssl_cookie.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ssl_srv.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ssl_ticket.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/ssl_tls.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/threading.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/timing.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/version.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/version_features.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/x509.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/x509write_crt.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/x509write_csr.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/x509_create.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/x509_crl.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/x509_crt.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/x509_csr.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/library/xtea.c"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/replacements/asn1write.c"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/replacements/ssl_srv.c"
            "${BSP_ROOT}/nRF5x/external/mbedtls/configs/config-ccm-psk-tls1_2.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/configs/config-mini-tls1_1.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/configs/config-no-entropy.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/configs/config-picocoin.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/configs/config-suite-b.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/configs/config-thread.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/aes.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/aesni.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/arc4.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/asn1.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/asn1write.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/base64.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/bignum.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/blowfish.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/bn_mul.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/camellia.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ccm.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/certs.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/check_config.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/cipher.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/cipher_internal.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/cmac.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/compat-1.3.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/config.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ctr_drbg.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/debug.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/des.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/dhm.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ecdh.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ecdsa.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ecjpake.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ecp.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/entropy.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/entropy_poll.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/error.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/gcm.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/havege.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/hmac_drbg.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/md.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/md2.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/md4.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/md5.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/md_internal.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/memory_buffer_alloc.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/net.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/net_sockets.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/oid.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/padlock.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/pem.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/pk.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/pkcs11.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/pkcs12.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/pkcs5.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/pk_internal.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/platform.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/platform_time.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ripemd160.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/rsa.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/sha1.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/sha256.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/sha512.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ssl.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ssl_cache.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ssl_ciphersuites.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ssl_cookie.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ssl_internal.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/ssl_ticket.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/threading.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/timing.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/version.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/x509.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/x509_crl.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/x509_crt.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/x509_csr.h"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls/xtea.h"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/nrf_tls.h"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/dtls/config/nrf_dtls_config.h"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/nrf_crypto/config/nrf_crypto_mbedtls_config.h"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/tls/config/nrf_tls_config.h")
        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.mbedtls.tls_interface}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/tls_interface.c")
        endif()


        set(_includes
            "${BSP_ROOT}/nRF5x/external/mbedtls/configs"
            "${BSP_ROOT}/nRF5x/external/mbedtls/doxygen/input"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include/mbedtls"
            "${BSP_ROOT}/nRF5x/external/mbedtls/include"
            "${BSP_ROOT}/nRF5x/external/nrf_tls"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/dtls/config"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/nrf_crypto/config"
            "${BSP_ROOT}/nRF5x/external/nrf_tls/mbedtls/tls/config")
        set(_defines "MBEDTLS_CONFIG_FILE=\"nrf_tls_config.h\"" "BLE_STACK_SUPPORT_REQD" "ENABLE_DEBUG_LOG_SUPPORT" "MBEDTLS_CTR_DRBG_C")
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.mbedtls" mbedtls "NRF5x Embedded TLS" "MbedTLS")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.stack_heap) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "")
        set(_includes)
        set(_defines "__STACK_SIZE=${BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.stacksize}" "__HEAP_SIZE=${BSP_CONFIGURATION_com.sysprogs.bspoptions.stackheap.heapsize}")
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.stack_heap" stack_heap "Fixed Size Stack & Heap" "Stack/Heap")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf51.freertos) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/freertos/readme.txt"
            "${BSP_ROOT}/nRF5x/freertos/license/license.txt"
            "${BSP_ROOT}/nRF5x/freertos/portable/CMSIS/nrf52/port_cmsis.c"
            "${BSP_ROOT}/nRF5x/freertos/portable/CMSIS/nrf52/port_cmsis_systick.c"
            "${BSP_ROOT}/nRF5x/freertos/portable/GCC/nrf52/port.c"
            "${BSP_ROOT}/nRF5x/freertos/source/croutine.c"
            "${BSP_ROOT}/nRF5x/freertos/source/event_groups.c"
            "${BSP_ROOT}/nRF5x/freertos/source/list.c"
            "${BSP_ROOT}/nRF5x/freertos/source/queue.c"
            "${BSP_ROOT}/nRF5x/freertos/source/readme.txt"
            "${BSP_ROOT}/nRF5x/freertos/source/stream_buffer.c"
            "${BSP_ROOT}/nRF5x/freertos/source/tasks.c"
            "${BSP_ROOT}/nRF5x/freertos/source/timers.c"
            "${BSP_ROOT}/nRF5x/freertos/config/FreeRTOSConfig.h"
            "${BSP_ROOT}/nRF5x/freertos/portable/CMSIS/nrf52/portmacro_cmsis.h"
            "${BSP_ROOT}/nRF5x/freertos/portable/GCC/nrf52/portmacro.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/croutine.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/deprecated_definitions.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/event_groups.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/FreeRTOS.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/list.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/message_buffer.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/mpu_prototypes.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/mpu_wrappers.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/portable.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/projdefs.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/queue.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/semphr.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/StackMacros.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/stack_macros.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/stream_buffer.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/task.h"
            "${BSP_ROOT}/nRF5x/freertos/source/include/timers.h")
        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap}" STREQUAL "heap_1")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/freertos/source/portable/MemMang/heap_1.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap}" STREQUAL "heap_2")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/freertos/source/portable/MemMang/heap_2.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap}" STREQUAL "heap_3")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/freertos/source/portable/MemMang/heap_3.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap}" STREQUAL "heap_4")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/freertos/source/portable/MemMang/heap_4.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.stm32.freertos.heap}" STREQUAL "heap_5")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/freertos/source/portable/MemMang/heap_5.c")
        endif()


        set(_includes "${BSP_ROOT}/nRF5x/FreeRTOS/Source/CMSIS_RTOS" "${BSP_ROOT}/nRF5x/FreeRTOS/Source/Include" "${BSP_ROOT}/nRF5x/FreeRTOS/Portable/gcc/nrf52" "${BSP_ROOT}/nRF5x/FreeRTOS/Portable/CMSIS/nrf52")
        set(_defines "USE_FREERTOS")
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf51.freertos" freertos "FreeRTOS" "FreeRTOS")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.iot) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources)
        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.background_dfu}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/iot/background_dfu/background_dfu_block.c"
                "${BSP_ROOT}/nRF5x/components/iot/background_dfu/background_dfu_operation.c"
                "${BSP_ROOT}/nRF5x/components/iot/background_dfu/background_dfu_state.c"
                "${BSP_ROOT}/nRF5x/components/iot/background_dfu/transport/tftp/tftp_dfu.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ble_6lowpan}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/iot/ble_6lowpan/ble_6lowpan.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.coap}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_block.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_message.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_observe.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_option.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_queue.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_resource.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_transport_dtls.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_transport_ipv6.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_transport_lwip.c"
                "${BSP_ROOT}/nRF5x/components/iot/coap/coap_transport_socket.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.context_manager}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/iot/context_manager/iot_context_manager.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.errno}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/iot/errno/errno.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_file}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/iot/iot_file/iot_file.c" "${BSP_ROOT}/nRF5x/components/iot/iot_file/static/iot_file_static.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.iot_timer}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/iot/iot_timer/iot_timer.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_parse}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/iot/ipv6_parse/ipv6_parse.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.ipv6_stack}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/dns6/dns6.c"
                "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/icmp6/icmp6.c"
                "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/ipv6/ipv6.c"
                "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/pbuffer/iot_pbuffer.c"
                "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/sntp_client/sntp_client.c"
                "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/tftp/iot_tftp.c"
                "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/udp/udp6.c"
                "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/utils/ipv6_utils.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.lwm2m}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/ipso_objects.c"
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/ipso_objects_tlv.c"
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/lwm2m.c"
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/lwm2m_bootstrap.c"
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/lwm2m_coap_util.c"
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/lwm2m_objects.c"
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/lwm2m_objects_tlv.c"
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/lwm2m_register.c"
                "${BSP_ROOT}/nRF5x/components/iot/lwm2m/lwm2m_tlv.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.medium}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/iot/medium/ipv6_medium_ble.c"
                "${BSP_ROOT}/nRF5x/components/iot/medium/ble_ncfgs/ble_ncfgs.c"
                "${BSP_ROOT}/nRF5x/components/iot/medium/commissioning/commissioning.c"
                "${BSP_ROOT}/nRF5x/components/iot/socket/config/medium/config_medium.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.mqtt}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/iot/mqtt/mqtt.c"
                "${BSP_ROOT}/nRF5x/components/iot/mqtt/mqtt_decoder.c"
                "${BSP_ROOT}/nRF5x/components/iot/mqtt/mqtt_encoder.c"
                "${BSP_ROOT}/nRF5x/components/iot/mqtt/mqtt_rx.c"
                "${BSP_ROOT}/nRF5x/components/iot/mqtt/mqtt_transport.c"
                "${BSP_ROOT}/nRF5x/components/iot/mqtt/mqtt_transport_lwip.c"
                "${BSP_ROOT}/nRF5x/components/iot/mqtt/mqtt_transport_tls.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.common}" STREQUAL "yes")
            set(_sources ${_sources} "${BSP_ROOT}/nRF5x/components/iot/socket/common/sleep.c" "${BSP_ROOT}/nRF5x/components/iot/socket/common/socket.c")
        endif()


        if("${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.socket}" STREQUAL "yes")
            set(_sources ${_sources}
                "${BSP_ROOT}/nRF5x/components/iot/socket/libraries/addr_util/inet_pton.c"
                "${BSP_ROOT}/nRF5x/components/iot/socket/libraries/fifo/nrf_fifo.c"
                "${BSP_ROOT}/nRF5x/components/iot/socket/libraries/mbuf/mbuf.c"
                "${BSP_ROOT}/nRF5x/components/iot/socket/libraries/portdb/portdb.c"
                "${BSP_ROOT}/nRF5x/components/iot/socket/platform/ble/socket_ble.c"
                "${BSP_ROOT}/nRF5x/components/iot/socket/transport/ipv6/transport_handler.c"
                "${BSP_ROOT}/nRF5x/components/iot/socket/transport/lwip/transport_handler.c")
        endif()


        set(_includes
            "${BSP_ROOT}/nRF5x/components/iot/background_dfu"
            "${BSP_ROOT}/nRF5x/components/iot/background_dfu/transport"
            "${BSP_ROOT}/nRF5x/components/iot/background_dfu/transport/tftp"
            "${BSP_ROOT}/nRF5x/components/iot/ble_6lowpan"
            "${BSP_ROOT}/nRF5x/components/iot/coap"
            "${BSP_ROOT}/nRF5x/components/iot/common"
            "${BSP_ROOT}/nRF5x/components/iot/context_manager"
            "${BSP_ROOT}/nRF5x/components/iot/errno"
            "${BSP_ROOT}/nRF5x/components/iot/iot_file"
            "${BSP_ROOT}/nRF5x/components/iot/iot_file/static"
            "${BSP_ROOT}/nRF5x/components/iot/iot_timer"
            "${BSP_ROOT}/nRF5x/components/iot/ipv6_parse"
            "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/icmp6"
            "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/include"
            "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/pbuffer"
            "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/sntp_client"
            "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/tftp"
            "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/udp"
            "${BSP_ROOT}/nRF5x/components/iot/ipv6_stack/utils"
            "${BSP_ROOT}/nRF5x/components/iot/lwm2m"
            "${BSP_ROOT}/nRF5x/components/iot/medium"
            "${BSP_ROOT}/nRF5x/components/iot/medium/ble_ncfgs"
            "${BSP_ROOT}/nRF5x/components/iot/medium/commissioning"
            "${BSP_ROOT}/nRF5x/components/iot/mqtt"
            "${BSP_ROOT}/nRF5x/components/iot/socket/api"
            "${BSP_ROOT}/nRF5x/components/iot/socket/api/arpa"
            "${BSP_ROOT}/nRF5x/components/iot/socket/api/netinet"
            "${BSP_ROOT}/nRF5x/components/iot/socket/api/sys"
            "${BSP_ROOT}/nRF5x/components/iot/socket/common"
            "${BSP_ROOT}/nRF5x/components/iot/socket/config/medium"
            "${BSP_ROOT}/nRF5x/components/iot/socket/libraries/fifo"
            "${BSP_ROOT}/nRF5x/components/iot/socket/libraries/mbuf"
            "${BSP_ROOT}/nRF5x/components/iot/socket/libraries/portdb")
        set(_defines "NRF_TLS_MAX_INSTANCE_COUNT=${BSP_CONFIGURATION_com.sysprogs.bspoptions.nrf5x.iot.tls_instance}")
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.iot" iot "Nordic IoT Components" "IoT")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_advertising OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_advertising) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_advertising/ble_advertising.c" "${BSP_ROOT}/nRF5x/ble_advertising/ble_advertising.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_advertising")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_advertising" ble_advertising "Bluetooth LE - Connectable Advertising Support (ble_advertising)" "BLE Connectable Advertising Support")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_db_discovery OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_db_discovery) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_db_discovery/ble_db_discovery.c" "${BSP_ROOT}/nRF5x/ble_db_discovery/ble_db_discovery.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_db_discovery")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_db_discovery" ble_db_discovery "Bluetooth LE - Database Discovery Module (ble_db_discovery)" "BLE Database Discovery Module")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_dtm OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_dtm) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/ble_dtm/ble_dtm.c"
            "${BSP_ROOT}/nRF5x/ble_dtm/ble_dtm_hw_nrf51.c"
            "${BSP_ROOT}/nRF5x/ble_dtm/ble_dtm_hw_nrf52.c"
            "${BSP_ROOT}/nRF5x/ble_dtm/ble_dtm.h"
            "${BSP_ROOT}/nRF5x/ble_dtm/ble_dtm_hw.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_dtm")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_dtm" ble_dtm "Bluetooth LE - RF/PHY Testing using DTM commands (ble_dtm)" "BLE RF/PHY Testing using DTM commands")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_racp OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_racp) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_racp/ble_racp.c" "${BSP_ROOT}/nRF5x/ble_racp/ble_racp.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_racp")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_racp" ble_racp "Bluetooth LE - Record Access Control Point library (ble_racp)" "BLE Record Access Control Point library")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_radio_notification OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_radio_notification) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_radio_notification/ble_radio_notification.c" "${BSP_ROOT}/nRF5x/ble_radio_notification/ble_radio_notification.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_radio_notification")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_radio_notification" ble_radio_notification "Bluetooth LE - Radio Notifications (ble_radio_notification)" "BLE Radio Notifications")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_ancs_c OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_ancs_c) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c/ancs_app_attr_get.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c/ancs_attr_parser.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c/ancs_tx_buffer.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c/nrf_ble_ancs_c.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c/ancs_app_attr_get.h"
            "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c/ancs_attr_parser.h"
            "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c/ancs_tx_buffer.h"
            "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c/nrf_ble_ancs_c.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_ancs_c")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_ancs_c" ble_ancs_c "Bluetooth LE - Apple Notification Service Client (ble_ancs_c)" "BLE Apple Notification Service Client")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_ans_c OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_ans_c) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_ans_c/ble_ans_c.c" "${BSP_ROOT}/nRF5x/ble_services/ble_ans_c/ble_ans_c.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_ans_c")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_ans_c" ble_ans_c "Bluetooth LE - Alert Notification Service Client (ble_ans_c)" "BLE Alert Notification Service Client")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_bas OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_bas) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_bas/ble_bas.c" "${BSP_ROOT}/nRF5x/ble_services/ble_bas/ble_bas.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_bas")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_bas" ble_bas "Bluetooth LE - Battery Service (ble_bas)" "BLE Battery Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_bas_c OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_bas_c) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_bas_c/ble_bas_c.c" "${BSP_ROOT}/nRF5x/ble_services/ble_bas_c/ble_bas_c.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_bas_c")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_bas_c" ble_bas_c "Bluetooth LE - Battery Service Client (ble_bas_c)" "BLE Battery Service Client")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_bps OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_bps) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_bps/ble_bps.c" "${BSP_ROOT}/nRF5x/ble_services/ble_bps/ble_bps.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_bps")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_bps" ble_bps "Bluetooth LE - Blood Pressure Service (ble_bps)" "BLE Blood Pressure Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_cscs OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_cscs) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/ble_services/ble_cscs/ble_cscs.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_cscs/ble_sc_ctrlpt.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_cscs/ble_cscs.h"
            "${BSP_ROOT}/nRF5x/ble_services/ble_cscs/ble_sc_ctrlpt.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_cscs")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_cscs" ble_cscs "Bluetooth LE - Cycling Speed and Cadence Service (ble_cscs)" "BLE Cycling Speed and Cadence Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_cts_c OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_cts_c) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_cts_c/ble_cts_c.c" "${BSP_ROOT}/nRF5x/ble_services/ble_cts_c/ble_cts_c.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_cts_c")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_cts_c" ble_cts_c "Bluetooth LE - Current Time Service Client (ble_cts_c)" "BLE Current Time Service Client")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_dfu OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_dfu) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/ble_services/ble_dfu/ble_dfu.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_dfu/ble_dfu_bonded.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_dfu/ble_dfu_unbonded.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_dfu/ble_dfu.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_dfu")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_dfu" ble_dfu "Bluetooth LE - Device Firmware Update Service (ble_dfu)" "BLE Device Firmware Update Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_dis OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_dis) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_dis/ble_dis.c" "${BSP_ROOT}/nRF5x/ble_services/ble_dis/ble_dis.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_dis")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_dis" ble_dis "Bluetooth LE - Device Information Service (ble_dis)" "BLE Device Information Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_gls OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_gls) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources
            "${BSP_ROOT}/nRF5x/ble_services/ble_gls/ble_gls.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_gls/ble_gls_db.c"
            "${BSP_ROOT}/nRF5x/ble_services/ble_gls/ble_gls.h"
            "${BSP_ROOT}/nRF5x/ble_services/ble_gls/ble_gls_db.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_gls")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_gls" ble_gls "Bluetooth LE - Glucose Service (ble_gls)" "BLE Glucose Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_hids OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_hids) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_hids/ble_hids.c" "${BSP_ROOT}/nRF5x/ble_services/ble_hids/ble_hids.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_hids")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_hids" ble_hids "Bluetooth LE - Human Interface Device Service (ble_hids)" "BLE Human Interface Device Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_hrs OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_hrs) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_hrs/ble_hrs.c" "${BSP_ROOT}/nRF5x/ble_services/ble_hrs/ble_hrs.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_hrs")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_hrs" ble_hrs "Bluetooth LE - Heart Rate Service (ble_hrs)" "BLE Heart Rate Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_hrs_c OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_hrs_c) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_hrs_c/ble_hrs_c.c" "${BSP_ROOT}/nRF5x/ble_services/ble_hrs_c/ble_hrs_c.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_hrs_c")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_hrs_c" ble_hrs_c "Bluetooth LE - Heart Rate Service Client (ble_hrs_c)" "BLE Heart Rate Service Client")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_hts OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_hts) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_hts/ble_hts.c" "${BSP_ROOT}/nRF5x/ble_services/ble_hts/ble_hts.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_hts")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_hts" ble_hts "Bluetooth LE - Health Thermometer Service (ble_hts)" "BLE Health Thermometer Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_ias OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_ias) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_ias/ble_ias.c" "${BSP_ROOT}/nRF5x/ble_services/ble_ias/ble_ias.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_ias")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_ias" ble_ias "Bluetooth LE - Immediate Alert Service (ble_ias)" "BLE Immediate Alert Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_ias_c OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_ias_c) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_ias_c/ble_ias_c.c" "${BSP_ROOT}/nRF5x/ble_services/ble_ias_c/ble_ias_c.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_ias_c")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_ias_c" ble_ias_c "Bluetooth LE - Immediate Alert Service Client (ble_ias_c)" "BLE Immediate Alert Service Client")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_lls OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_lls) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_lls/ble_lls.c" "${BSP_ROOT}/nRF5x/ble_services/ble_lls/ble_lls.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_lls")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_lls" ble_lls "Bluetooth LE - Link Loss Service (ble_lls)" "BLE Link Loss Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_nus OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_nus) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_nus/ble_nus.c" "${BSP_ROOT}/nRF5x/ble_services/ble_nus/ble_nus.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_nus")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_nus" ble_nus "Bluetooth LE - Nordic UART Service (ble_nus)" "BLE Nordic UART Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_rscs OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_rscs) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_rscs/ble_rscs.c" "${BSP_ROOT}/nRF5x/ble_services/ble_rscs/ble_rscs.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_rscs")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_rscs" ble_rscs "Bluetooth LE - Running Speed and Cadence Service (ble_rscs)" "BLE Running Speed and Cadence Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_rscs_c OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_rscs_c) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_rscs_c/ble_rscs_c.c" "${BSP_ROOT}/nRF5x/ble_services/ble_rscs_c/ble_rscs_c.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_rscs_c")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_rscs_c" ble_rscs_c "Bluetooth LE - Running Speed and Cadence Service Client (ble_rscs_c)" "BLE Running Speed and Cadence Service Client")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_tps OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_tps) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_tps/ble_tps.c" "${BSP_ROOT}/nRF5x/ble_services/ble_tps/ble_tps.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_tps")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_tps" ble_tps "Bluetooth LE - TX Power Service (ble_tps)" "BLE TX Power Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_link_ctx_manager OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_link_ctx_manager) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_link_ctx_manager/ble_link_ctx_manager.c" "${BSP_ROOT}/nRF5x/ble_link_ctx_manager/ble_link_ctx_manager.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_link_ctx_manager")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_link_ctx_manager" ble_link_ctx_manager "Bluetooth LE - Ble_Link_CTX_manager (ble_link_ctx_manager)" "BLE Ble_Link_CTX_manager")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_ipsp OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_ipsp) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/ble_services/ble_ipsp/ble_ipsp.c" "${BSP_ROOT}/nRF5x/ble_services/ble_ipsp/ble_ipsp.h")
        set(_includes "${BSP_ROOT}/nRF5x/ble_services/ble_ipsp")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_ipsp" ble_ipsp "Bluetooth LE - IPSP Service (ble_ipsp)" "BLE IPSP Service")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_nrf_ble_qwr OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_nrf_ble_qwr) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/nrf_ble_qwr/nrf_ble_qwr.c" "${BSP_ROOT}/nRF5x/nrf_ble_qwr/nrf_ble_qwr.h")
        set(_includes "${BSP_ROOT}/nRF5x/nrf_ble_qwr")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_nrf_ble_qwr" ble_nrf_ble_qwr "Bluetooth LE - Nrf_Ble_Qwr (nrf_ble_qwr)" "BLE Nrf_Ble_Qwr")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    if((DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrf5x.ble_nrf_ble_scan OR DEFINED BSP_FRAMEWORK_com.sysprogs.arm.nordic.nrfx.ble_nrf_ble_scan) AND "${BSP_MCU}" MATCHES "^nRF.*")
        set(_sources "${BSP_ROOT}/nRF5x/nrf_ble_scan/nrf_ble_scan.c" "${BSP_ROOT}/nRF5x/nrf_ble_scan/nrf_ble_scan.h")
        set(_includes "${BSP_ROOT}/nRF5x/nrf_ble_scan")
        set(_defines)
        set(_forced_includes)
        create_bsp_framework_library_from_vars(BSP "com.sysprogs.arm.nordic.nrf5x.ble_nrf_ble_scan" ble_nrf_ble_scan "Bluetooth LE - Nrf_Ble_Scan (nrf_ble_scan)" "BLE Nrf_Ble_Scan")
        set(_framework_libraries ${_framework_libraries} "${_created_library}")
    endif()

    set(_core_includes "${_core_includes}" PARENT_SCOPE)
    set(_core_defines "${_core_defines}" PARENT_SCOPE)
    set(_core_forced_includes "${_core_forced_includes}" PARENT_SCOPE)
    set(_framework_libraries "${_framework_libraries}" PARENT_SCOPE)
endfunction() #visualgdb_bsp_instantiate_referenced_frameworks

