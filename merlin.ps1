param([string]$path = "C:\vsl\")

  VsVars

  set MERLIN_ROOT="$path\Merlin\Main"
  set MERLIN_EXTERNAL="${env:MERLIN_ROOT}\..\External.LCA_RESTRICTED"
  set RUBY18_BIN="${env:MERLIN_EXTERNAL}\Languages\Ruby\ruby-1.8.6p287\bin"
  set RUBY18_EXE="${env:RUBY18_BIN}\ruby.exe"
  set RUBY19_EXE="${env:MERLIN_EXTERNAL}\Languages\Ruby\1.9.1p0\bin\ruby.exe"

  $alias = $env:MERLIN_ROOT + '\Scripts\bat\Alias.ps1'
  if (test-path $alias) { . $alias }
  . $scripts\append-path.ps1 "${env:RUBY18_BIN}"
  
  . $scripts\append-path.ps1 "${env:MERLIN_ROOT}\External\Tools"
  . $scripts\append-path.ps1 "${env:MERLIN_ROOT}\Scripts\Bat"
  . $scripts\append-path.ps1 "${env:MERLIN_ROOT}\..\Snap\bin"
  . $scripts\append-path.ps1 "${env:MERLIN_EXTERNAL}\Languages\IronRuby\mspec\mspec\bin"
  . $scripts\append-path.ps1 "${env:MERLIN_ROOT}\Languages\Ruby\Scripts"
   
  function global:dbin { cd $env:MERLIN_ROOT\Bin\Debug }
  function global:rbin { cd $env:MERLIN_ROOT\Bin\Release }
  if (Test-Path function:\rbt) { Remove-Item -Force function:\rbt }
  function global:rbl { cd $env:MERLIN_ROOT\Languages\Ruby\IronRuby.Libraries}
  function global:rbt { cd $env:MERLIN_ROOT\Languages\Ruby\Tests}
  function global:rb { cd $env:MERLIN_ROOT\Languages\Ruby }
  function global:script { cd $env:MERLIN_ROOT\Scripts\Bat }
  function global:root { cd $env:MERLIN_ROOT }
  function global:ext { cd $env:MERLIN_EXTERNAL}
  function global:irb19 {cmd /C "${env:MERLIN_EXTERNAL}\Languages\Ruby\ruby-1.9.1p0\bin\irb.bat $args"}
  function global:ruby19 {cmd /C "${env:MERLIN_EXTERNAL}\Languages\Ruby\ruby-1.9.1p0\bin\ruby.exe $args"}
  function global:geninit {cmd /C "${env:MERLIN_ROOT}\Languages\Ruby\Libraries.LCA_RESTRICTED\GenerateInitializers.cmd"}
  if (Test-path function:ruby) {Remove-Item -Force function:ruby}
  if (Test-path function:irb) {Remove-Item -Force function:irb}
  rb
