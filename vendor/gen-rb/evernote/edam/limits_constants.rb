#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'limits_types'

      module Evernote
        module EDAM
          module Limits
            EDAM_ATTRIBUTE_LEN_MIN = 1

            EDAM_ATTRIBUTE_LEN_MAX = 4096

            EDAM_ATTRIBUTE_REGEX = %q"^[^\\p{Cc}\\p{Zl}\\p{Zp}]{1,4096}$"

            EDAM_ATTRIBUTE_LIST_MAX = 100

            EDAM_ATTRIBUTE_MAP_MAX = 100

            EDAM_GUID_LEN_MIN = 36

            EDAM_GUID_LEN_MAX = 36

            EDAM_GUID_REGEX = %q"^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"

            EDAM_EMAIL_LEN_MIN = 6

            EDAM_EMAIL_LEN_MAX = 255

            EDAM_EMAIL_LOCAL_REGEX = %q"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*$"

            EDAM_EMAIL_DOMAIN_REGEX = %q"^[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*\\.([A-Za-z]{2,})$"

            EDAM_EMAIL_REGEX = %q"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*\\.([A-Za-z]{2,})$"

            EDAM_TIMEZONE_LEN_MIN = 1

            EDAM_TIMEZONE_LEN_MAX = 32

            EDAM_TIMEZONE_REGEX = %q"^([A-Za-z_-]+(/[A-Za-z_-]+)*)|(GMT(-|\\+)[0-9]{1,2}(:[0-9]{2})?)$"

            EDAM_MIME_LEN_MIN = 3

            EDAM_MIME_LEN_MAX = 255

            EDAM_MIME_REGEX = %q"^[A-Za-z]+/[A-Za-z0-9._+-]+$"

            EDAM_MIME_TYPE_GIF = %q"image/gif"

            EDAM_MIME_TYPE_JPEG = %q"image/jpeg"

            EDAM_MIME_TYPE_PNG = %q"image/png"

            EDAM_MIME_TYPE_WAV = %q"audio/wav"

            EDAM_MIME_TYPE_MP3 = %q"audio/mpeg"

            EDAM_MIME_TYPE_AMR = %q"audio/amr"

            EDAM_MIME_TYPE_MP4_VIDEO = %q"video/mp4"

            EDAM_MIME_TYPE_INK = %q"application/vnd.evernote.ink"

            EDAM_MIME_TYPE_PDF = %q"application/pdf"

            EDAM_MIME_TYPE_DEFAULT = %q"application/octet-stream"

            EDAM_MIME_TYPES = Set.new([
              %q"image/gif",
              %q"image/jpeg",
              %q"image/png",
              %q"audio/wav",
              %q"audio/mpeg",
              %q"audio/amr",
              %q"application/vnd.evernote.ink",
              %q"application/pdf",
              %q"video/mp4",
            ])

            EDAM_COMMERCE_SERVICE_GOOGLE = %q"Google"

            EDAM_COMMERCE_SERVICE_PAYPAL = %q"Paypal"

            EDAM_COMMERCE_SERVICE_GIFT = %q"Gift"

            EDAM_COMMERCE_SERVICE_TRIALPAY = %q"TrialPay"

            EDAM_COMMERCE_SERVICE_TRIAL = %q"Trial"

            EDAM_COMMERCE_SERVICE_GROUP = %q"Group"

            EDAM_COMMERCE_SERVICE_CYBERSOURCE = %q"CYBERSRC"

            EDAM_COMMERCE_DEFAULT_CURRENCY_COUNTRY_CODE = %q"USD"

            EDAM_SEARCH_QUERY_LEN_MIN = 0

            EDAM_SEARCH_QUERY_LEN_MAX = 1024

            EDAM_SEARCH_QUERY_REGEX = %q"^[^\\p{Cc}\\p{Zl}\\p{Zp}]{0,1024}$"

            EDAM_HASH_LEN = 16

            EDAM_USER_USERNAME_LEN_MIN = 1

            EDAM_USER_USERNAME_LEN_MAX = 64

            EDAM_USER_USERNAME_REGEX = %q"^[a-z0-9]([a-z0-9_-]{0,62}[a-z0-9])?$"

            EDAM_USER_NAME_LEN_MIN = 1

            EDAM_USER_NAME_LEN_MAX = 255

            EDAM_USER_NAME_REGEX = %q"^[^\\p{Cc}\\p{Zl}\\p{Zp}]{1,255}$"

            EDAM_TAG_NAME_LEN_MIN = 1

            EDAM_TAG_NAME_LEN_MAX = 100

            EDAM_TAG_NAME_REGEX = %q"^[^,\\p{Cc}\\p{Z}]([^,\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^,\\p{Cc}\\p{Z}])?$"

            EDAM_NOTE_TITLE_LEN_MIN = 1

            EDAM_NOTE_TITLE_LEN_MAX = 255

            EDAM_NOTE_TITLE_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,253}[^\\p{Cc}\\p{Z}])?$"

            EDAM_NOTE_CONTENT_LEN_MIN = 0

            EDAM_NOTE_CONTENT_LEN_MAX = 5242880

            EDAM_APPLICATIONDATA_NAME_LEN_MIN = 3

            EDAM_APPLICATIONDATA_NAME_LEN_MAX = 32

            EDAM_APPLICATIONDATA_VALUE_LEN_MIN = 0

            EDAM_APPLICATIONDATA_VALUE_LEN_MAX = 4092

            EDAM_APPLICATIONDATA_ENTRY_LEN_MAX = 4095

            EDAM_APPLICATIONDATA_NAME_REGEX = %q"^[A-Za-z0-9_.-]{3,32}$"

            EDAM_APPLICATIONDATA_VALUE_REGEX = %q"^[^\\p{Cc}]{0,4092}$"

            EDAM_NOTEBOOK_NAME_LEN_MIN = 1

            EDAM_NOTEBOOK_NAME_LEN_MAX = 100

            EDAM_NOTEBOOK_NAME_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^\\p{Cc}\\p{Z}])?$"

            EDAM_NOTEBOOK_STACK_LEN_MIN = 1

            EDAM_NOTEBOOK_STACK_LEN_MAX = 100

            EDAM_NOTEBOOK_STACK_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^\\p{Cc}\\p{Z}])?$"

            EDAM_PUBLISHING_URI_LEN_MIN = 1

            EDAM_PUBLISHING_URI_LEN_MAX = 255

            EDAM_PUBLISHING_URI_REGEX = %q"^[a-zA-Z0-9.~_+-]{1,255}$"

            EDAM_PUBLISHING_URI_PROHIBITED = Set.new([
              %q"..",
            ])

            EDAM_PUBLISHING_DESCRIPTION_LEN_MIN = 1

            EDAM_PUBLISHING_DESCRIPTION_LEN_MAX = 200

            EDAM_PUBLISHING_DESCRIPTION_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,198}[^\\p{Cc}\\p{Z}])?$"

            EDAM_SAVED_SEARCH_NAME_LEN_MIN = 1

            EDAM_SAVED_SEARCH_NAME_LEN_MAX = 100

            EDAM_SAVED_SEARCH_NAME_REGEX = %q"^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^\\p{Cc}\\p{Z}])?$"

            EDAM_USER_PASSWORD_LEN_MIN = 6

            EDAM_USER_PASSWORD_LEN_MAX = 64

            EDAM_USER_PASSWORD_REGEX = %q"^[A-Za-z0-9!#$%&'()*+,./:;<=>?@^_`{|}~\\[\\]\\\\-]{6,64}$"

            EDAM_NOTE_TAGS_MAX = 100

            EDAM_NOTE_RESOURCES_MAX = 1000

            EDAM_USER_TAGS_MAX = 100000

            EDAM_USER_SAVED_SEARCHES_MAX = 100

            EDAM_USER_NOTES_MAX = 100000

            EDAM_USER_NOTEBOOKS_MAX = 250

            EDAM_USER_RECENT_MAILED_ADDRESSES_MAX = 10

            EDAM_USER_MAIL_LIMIT_DAILY_FREE = 50

            EDAM_USER_MAIL_LIMIT_DAILY_PREMIUM = 200

            EDAM_USER_UPLOAD_LIMIT_FREE = 62914560

            EDAM_USER_UPLOAD_LIMIT_PREMIUM = 1073741824

            EDAM_NOTE_SIZE_MAX_FREE = 26214400

            EDAM_NOTE_SIZE_MAX_PREMIUM = 52428800

            EDAM_RESOURCE_SIZE_MAX_FREE = 26214400

            EDAM_RESOURCE_SIZE_MAX_PREMIUM = 52428800

            EDAM_USER_LINKED_NOTEBOOK_MAX = 100

            EDAM_NOTEBOOK_SHARED_NOTEBOOK_MAX = 250

            EDAM_NOTE_CONTENT_CLASS_LEN_MIN = 3

            EDAM_NOTE_CONTENT_CLASS_LEN_MAX = 32

            EDAM_HELLO_APP_CONTENT_CLASS_PREFIX = %q"evernote.hello."

            EDAM_FOOD_APP_CONTENT_CLASS_PREFIX = %q"evernote.food."

            EDAM_NOTE_CONTENT_CLASS_REGEX = %q"^[A-Za-z0-9_.-]{3,32}$"

            EDAM_CONTENT_CLASS_HELLO_ENCOUNTER = %q"evernote.hello.encounter"

            EDAM_CONTENT_CLASS_HELLO_PROFILE = %q"evernote.hello.profile"

            EDAM_CONTENT_CLASS_FOOD_MEAL = %q"evernote.food.meal"

            EDAM_CONTENT_CLASS_SKITCH = %q"evernote.skitch"

            EDAM_RELATED_PLAINTEXT_LEN_MIN = 1

            EDAM_RELATED_PLAINTEXT_LEN_MAX = 131072

            EDAM_RELATED_MAX_NOTES = 25

            EDAM_RELATED_MAX_NOTEBOOKS = 1

            EDAM_RELATED_MAX_TAGS = 25

    end
  end
end
