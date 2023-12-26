include("./styles.lua")

planeX = globalPropertyf("sim/flightmodel/position/local_x")
planeY = globalPropertyf("sim/flightmodel/position/local_y")
planeZ = globalPropertyf("sim/flightmodel/position/local_z")
testCameraHeading = 0.0
testCameraPitch = 0.0
testCameraDistance = 200.0
testCameraAdvance = 0.2
function testCameraController()
    testCameraHeading = (testCameraHeading + 0.1) % 360
    if testCameraDistance > 400.0 or testCameraDistance < 45.0 then
        testCameraAdvance = -testCameraAdvance
    end
    testCameraDistance = testCameraDistance + testCameraAdvance
    dx = -testCameraDistance * math.sin(testCameraHeading * 3.1415 / 180.0)
    dz = testCameraDistance * math.cos(testCameraHeading * 3.1415 / 180.0)
    dy = testCameraDistance / 5
    x = get(planeX) + dx
    y = get(planeY) + dy
    z = get(planeZ) + dz
    sasl.setCamera(x, y, z, testCameraPitch, testCameraHeading, -30.0, 1.0)
end
testControllerID = sasl.registerCameraController(testCameraController)
-- sasl.startCameraControl(testControllerID, CAMERA_NOT_CONTROLLED)

cameraImageID = sasl.gl.createTexture(355, 240)
cameraTarget = sasl.gl.createRenderTarget(335, 240, 1, RENDER_TARGET_CDS)

function draw()
    sasl.gl.drawRectangle(10, 10, 335, 240, black)

    -- cameraParams = sasl.gl.getTargetTextureData(cameraImageID, 0, 0, 355, 240)

    cameraImage = sasl.gl.imageFromTexture("sr71-radar.jpg", cameraImageID)

    sasl.logInfo(cameraImageID, cameraTarget)

    -- sasl.gl.setRenderTarget(testImage)

    -- openglTexId = sasl.gl.exportTexture(testImage)
    -- sasl.gl.imageFromTexture("sr-radar.jpg", testImage)

    -- sasl.gl.drawTexture(testImage, 0, 0, 335, 240, black)

end
