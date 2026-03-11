{ ... }:

{
    programs.brave = {
        enable = true;
        extensions = [
            "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
            "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
            "hlkljlkdinjnbfmclionhbefbnefcgll" # Microslop
            "gebbhagfogifgggkldgodflihgfeippi" # Return Youtube Dislike
            "enamippconapkdmgfgjchkhakpfinmaj" # DeArrow
            "bfhkfdnddlhfippjbflipboognpdpoeh" # reMarkable
        ];

        commandLineArgs = [
            "--disable-features=AutofillSavePaymentMethods"
            "--enable-features=TouchpadOverscrollHistoryNavigation"
        ];
    };
}
