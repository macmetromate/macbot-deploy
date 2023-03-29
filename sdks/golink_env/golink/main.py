import goLinkManager as glm
import time

if __name__ == "__main__":
    POWER_DIST = 2
    MOTOR_DRIVER_LEFT = 4
    MOTOR_DRIVER_RIGHT = 5
    
    systemNodeIds = [POWER_DIST, MOTOR_DRIVER_LEFT, MOTOR_DRIVER_RIGHT]
    man = glm.GoLinkManager(systemNodeIds)
    man.startNodes()

    while 1:
        
        if man.isNewData(MOTOR_DRIVER_LEFT):
            print(man.getData(MOTOR_DRIVER_LEFT))
            man.setData(MOTOR_DRIVER_LEFT, {'spr' : int(5)})
            
        time.sleep(0.05)

