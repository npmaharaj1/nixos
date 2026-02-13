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
        ];

        commandLineArgs = [
            "--disable-features=AutofillSavePaymentMethods"
        ];
    };
}
