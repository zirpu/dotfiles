; mh-e stuff
(setq mh-clean-message-header t)

(setq mh-invisible-header-fields
 '("Message-ID:" "Content-Type:" "User-Agent:" "Received:" "Return-Path:" 
   "Delivered-To:" "Mail-Followup-To:" "Mime-Version:" 
   "Content-Disposition:" "Sender:" "Errors-To:" "Precedence:" 
   "List-"
   "X-"
   "Received:"
   "Message-Id:"
   "Remailed-"
   "Via:"
   "Mail-from:"
   "Return-Path:"
   "In-Reply-To:"
   "Resent-"
   "Posted:"
   "DKIM-Signature:"
   "Complaints-To:"
   "Injection-Info:"
   "Organization:"
   "Newsgroups:"
   )
)
