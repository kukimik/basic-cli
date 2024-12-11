module [get!, all!]

import PlatformTasks

## Returns the most preferred locale for the system or application, or `NotAvailable` if the locale could not be obtained.
##
## The returned [Str] is a BCP 47 language tag, like `en-US` or `fr-CA`.
get! : {} => Result Str [NotAvailable]
get! = \{} ->
    PlatformTasks.getLocale! {}
    |> Result.mapErr \{} -> NotAvailable

## Returns the preferred locales for the system or application.
##
## The returned [Str] are BCP 47 language tags, like `en-US` or `fr-CA`.
all! : {} => List Str
all! = PlatformTasks.getLocales!
