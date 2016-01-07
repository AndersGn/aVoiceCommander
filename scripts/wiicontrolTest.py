import cwiid
import time

wm = cwiid.Wiimote()

wm.rpt_mode = cwiid.RPT_BTN | cwiid.RPT_ACC #| cwiid.RPT_CLASSIC| cwiid.RPT_NUNCHUK

while True:
  print(wm.state['acc'])
  time.sleep(0.3)
