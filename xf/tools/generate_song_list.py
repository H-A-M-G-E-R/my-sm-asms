print("SongPointers:")
for i in range(0, 0xAB, 3):
    print(f'  dl Song{i:02X}')
print()
print("SampleTransferDefPointers:")
for i in range(0, 0xAB, 3):
    print(f'  dl SampleTransferDef{i:02X}')
print()
print("SwappableSamplePointers:")
for i in range(0x2A):
    print(f'  dl SwappableSample{i:02X}')
print()
for i in range(0, 0xAB, 3):
    print(f'Song{i:02X}: incbin "music/{i:02X}.nspc"')
print()
for i in range(0x2A):
    print(f'SwappableSample{i:02X}: incbin "swappable_samples/{i:02X}.nspc"')
