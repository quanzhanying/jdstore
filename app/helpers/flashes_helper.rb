module FlashesHelper
  FLASH_CLSSS = { alert: "danger", notic: "success", waring: "warning"}.freeze

  def flash_class(key)
    FLASH_CLSSS.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end
end
