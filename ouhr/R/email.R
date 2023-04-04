#' Creating an Email
#'
#' Creating an email based on inputs provided. Option to add an attachment.
#'
#' @param To A string of email addresses separated by "`;`".
#' @param Cc A string of email addresses separated by "`;`".
#' @param subject A string.
#' @param dear A string. Defaults to "`all`".
#' @param body A string with paragraphs separated by "`<p>`".
#' @param table A table defined in global environment.
#' @param body2 A string with paragraphs separated by "`<p>`".
#' @param attachment A string containing filepath and name using `/` instead of `\`.
#'
#' @return An email.
#' @export
#'
#' @examples \dontrun{
#' email(To = "address1; address2;", subject = "test", body = "Para1. <p> Para2.")
#' }

email <- function(To, Cc, subject, dear = "all", body, table, body2, attachment) {
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

  # Email subject line
  # If subject not specified, will be left blank
  if(!missing(subject)){
    outMail[["subject"]] <- subject
  }

  # Email body
  # If body not specified, will be left blank. User should use <p> in their string to split into paragraphs.
  if(!missing(body) & missing(table) & missing(body2)){
    outMail[["HTMLBody"]] <- paste0('<p>',
                                    stringr::str_replace("Dear X,", "X", dear),
                                    '</p>',
                                    body,
                                    '</p>',
                                    signature,
                                    '</p>'
    )
  }

  if(!missing(body) & !missing(table) & missing(body2)){
    outMail[["HTMLBody"]] <- paste0('<p>',
                                    stringr::str_replace("Dear X,", "X", dear),
                                    '</p>',
                                    body,
                                    '</p>',
                                    table,
                                    '</p>',
                                    signature,
                                    '</p>'
    )
  }

  if(!missing(body) & !missing(table) & !missing(body2)){
    outMail[["HTMLBody"]] <- paste0('<p>',
                                    stringr::str_replace("Dear X,", "X", dear),
                                    '</p>',
                                    body,
                                    '</p>',
                                    table,
                                    '</p>',
                                    body2,
                                    '</p>',
                                    signature,
                                    '</p>'
    )
  }
  # Email attachments
  # If attachment not specified, will be left blank.
  # If R cannot find attachment, process is stopped and user asked to check file exists and filename is correct. user has to use / not \ in filename.
  if(!missing(attachment)){

    if(file.exists(attachment)){
      outMail[["Attachments"]]$Add(attachment)
    }

    if(!file.exists(attachment)){
      stop("Attachment not found. Please check that the file you wish to attach exists and that you have provided the correct filename and used /.")
    }

  }

  # Opens email in new window so can review before sending:
  outMail$Display()

}

