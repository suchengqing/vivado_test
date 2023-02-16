set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports USB_DATA[0]]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports USB_DATA[1]]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports USB_DATA[2]]
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports USB_DATA[3]]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports USB_DATA[4]]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports USB_DATA[5]]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports USB_DATA[6]]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports USB_DATA[7]]

set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports CLK_60M]
set_property -dict {PACKAGE_PIN V20 IOSTANDARD LVCMOS33} [get_ports RXVALID]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports RXACTIVE]
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports RXERR]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports RESET]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_60M]


set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports XCVRSEL0]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports XCVRSEL1]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports TXRMSEL]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports TXVLAD]

set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports LINESTA0]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports LINESTA1]