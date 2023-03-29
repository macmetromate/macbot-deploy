import isotp
import logging
import time
import threading

from can.interfaces.socketcan import SocketcanBus

class ThreadedApp:
   def __init__(self):
      self.exit_requested = False
      self.bus = SocketcanBus(channel='can0')
      addr = isotp.Address(isotp.AddressingMode.Normal_11bits, rxid=0x123, txid=0x456)
      self.stack = isotp.CanStack(self.bus, address=addr, error_handler=self.my_error_handler)

   def start(self):
      self.exit_requested = False
      self.thread = threading.Thread(target = self.thread_task)
      self.thread.start()

   def stop(self):
      self.exit_requested = True
      if self.thread.isAlive():
         self.thread.join()

   def my_error_handler(self, error):
      logging.warning('IsoTp error happened : %s - %s' % (error.__class__.__name__, str(error)))

   def thread_task(self):
      while self.exit_requested == False:
         self.stack.process()                # Non-blocking
         time.sleep(self.stack.sleep_time()) # Variable sleep time based on state machine state

   def shutdown(self):
      self.stop()
      self.bus.shutdown()

if __name__ == '__main__':
   app = ThreadedApp()
   app.start()

   print('Waiting for payload - maximum 5 sec')
   t1 = time.time()
   while time.time() - t1 < 5:
      if app.stack.available():
         payload = app.stack.recv()
         print("Received payload : %s" % (payload))
         break
      time.sleep(0.2)

   print("Exiting")
   app.shutdown()