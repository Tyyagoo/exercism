(ns bank-account)

(defn open-account []
  (agent 0))

(defn close-account [account]
  (send account (fn [_] nil))
  nil)

(defn get-balance [account]
  (await account)
  @account)

(defn update-balance [account amount]
  (send account (fn [balance] (max 0 (+ balance amount)))))
