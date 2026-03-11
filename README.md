# Feeling_Assembly
First run at assembly


Just working on learning the basics and how it works. 

# Linux 32 Bit
`nasm -felf32 assembly.asm && ld -m elf_i386 assembly.o`

# Windows 32 Bit
`ml.exe /c /coff /Cp .\assembly.asm`

  ml.exe is the MASM executable with the following switches:
  /c – Assemble without linking
  /coff – Generate a COFF format object file
  /Cp – Preserve the case sensitivity

Once the object file assembly.obj has been successfully created, you will then have to run the linker against the object file and include a reference to the kernel32.lib 
`link /SUBSYSTEM:console /defaultlib:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\um\x86\kernel32.lib" .\assembly.obj`
 
  LINK is the linker which will finally create the executable. You must include the following switches:
  /SUBSYSTEM – This tells the linker that the executable will run through the console only, not create a graphical user   interface.
  /defaultlib – This tells the linker where the labels attached to the extern directive can be found.

# Linux 64 Bit
In order to create a 64-bit executable, run the command shown below:
`nasm -felf64 assembly.asm && ld assembly.o`
-felf64 – specifies the architecture to be 64-bit when assembled
`file a.out`
verifies correct compilation
