#' Creating emails for info requests.
#'
#' Depending on the type specified, creates an email to send link to data or password to the requester.
#'
#' @param To A string of email addresses separated by "`;`".
#' @param Cc A string of email addresses separated by "`;`".
#' @param type Either "`link`", "`password`", "`attachment`" or "`table`" to determine email contents.
#' @param INF_Number A string.
#' @param INF_Name A string.
#' @param dear A string.
#' @param password A string.
#' @param filename A string containing filepath and name of attachment using `/` instead of `\`.
#' @param table A table defined in global environment.
#'
#' @return One of two emails, depending on type specified.
#' @export
#'
#' @examples
#'  \dontrun{email_info_request(type = "password",
#' To = "email_address",
#' dear = "email_recipient",
#' password = "test"
#' )
#' }

email_info_request <- function(To, Cc, type, INF_Number = NULL, INF_Name = NULL, dear = NULL, password = NULL, filename = NULL, table = NULL) {
  # NB: Requires stringr, RDCOMClient

  # Creating an email
  OutApp <- RDCOMClient::COMCreate("Outlook.Application")
  outMail <- OutApp$CreateItem(0)

  # Getting the signature
    # If there are no signatures or multiple, no signature will be pulled into the email
  outMail$GetInspector()
  signature <- outMail[["HTMLBody"]]

  # Email recipients
    # If To and CC not specified, these will be left blank
  if(!missing(To)){
    outMail[["To"]] <- To
  }

  if(!missing(Cc)){
    outMail[["Cc"]] <- Cc
  }

  # Body, subject and attachments of message depends on the type of email.
    # PID info requests will have one email to send out the link to the data and another to send out the password.
    # Non PID info requests can either have an email to send out an attachment or an email to send out a table in the body of the email.
  if(type == "link"){
    outMail[["subject"]] <- paste(INF_Number, "-", INF_Name)

    outMail[["HTMLBody"]] <- paste0('<p>',
                                    stringr::str_replace("Dear X,", "X", dear),
                                    '<p>',
                                    "Please find the data in: INSERT LINK HERE",
                                    '<p>',
                                    "The password will follow in another email. This information will be available for a period of 4 weeks; please ensure that the data is used or stored safely if you need the data after this time. You may need to log off and then back on for access to the file.",
                                    '<p>',
                                    "Please let me know if you have any questions.",
                                    signature,
                                    '</p>'
    )
  }

  if(type == "password"){
    outMail[["HTMLBody"]] <- paste0('<p>',
                                    stringr::str_replace("Dear X,", "X", dear),
                                    '<p>',
                                    "P: ",
                                    password,
                                    '<p>',
                                    signature,
                                    '</p>'
                                    )

    }

  if(type == "attachment"){
    outMail[["subject"]] <- paste(INF_Number, "-", INF_Name)

    outMail[["HTMLBody"]] <- paste0('<p>',
                                    stringr::str_replace("Dear X,", "X", dear),
                                    '<p>',
                                    "Please find the data attached.",
                                    '<p>',
                                    "Please let me know if you have any questions.",
                                    signature,
                                    '</p>'
                                    )

      if(file.exists(filename)){
        outMail[["Attachments"]]$Add(filename)
      }

      if(!file.exists(filename)){
        stop("Attachment not found. Please check that the file you wish to attach exists and that you have provided the correct filename and used /.")
      }
    }

  if(type == "table"){
    outMail[["subject"]] <- paste(INF_Number, "-", INF_Name)

    outMail[["HTMLBody"]] <- paste0('<p>',
                                    stringr::str_replace("Dear X,", "X", dear),
                                    '<p>',
                                    "Please find the data in the table below.",
                                    '<p>',
                                    table,
                                    '<p>',
                                    "Please let me know if you have any questions.",
                                    signature,
                                    '</p>'
                                    )
    }

  # Opens email in new window so can review before sending:
  outMail$Display()

}
