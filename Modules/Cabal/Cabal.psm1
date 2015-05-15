Function Start-SandboxedGHC {
    ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d
}


Function Start-SandboxedGHCI {
    ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d
}


Function Start-SandboxedRunHaskell {
    runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d
}


New-Alias -name ghcsandbox -value Start-SandboxedGHC
New-Alias -name ghcisandbox -value Start-SandboxedGHCI
New-Alias -name runhaskellsandbox -value Start-SandboxedRunHaskell

Export-ModuleMember -Function * -Alias *
