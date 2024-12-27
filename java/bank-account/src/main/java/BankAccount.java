import java.util.concurrent.atomic.AtomicInteger;

class BankAccount {
    private AtomicInteger balance = null;

    void assertOpen(String message) throws BankAccountActionInvalidException {
        if (this.balance == null) {
            throw new BankAccountActionInvalidException(message);
        }
    }

    void assertPositive(int amount) throws BankAccountActionInvalidException {
        if (amount >= 0) return;
        throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
    }

    void open() throws BankAccountActionInvalidException {
        if (this.balance != null) {
            throw new BankAccountActionInvalidException("Account already open");
        }
        
        this.balance = new AtomicInteger();
    }

    void close() throws BankAccountActionInvalidException {
        assertOpen("Account not open");
        this.balance = null;
    }

    synchronized int getBalance() throws BankAccountActionInvalidException {
        assertOpen("Account closed");
        return this.balance.get();
    }

    synchronized void deposit(int amount) throws BankAccountActionInvalidException {
        assertOpen("Account closed");
        assertPositive(amount);
        this.balance.updateAndGet(balance -> amount + balance);
    }

    synchronized void withdraw(int amount) throws BankAccountActionInvalidException {
        assertOpen("Account closed");
        assertPositive(amount);

        int balance = this.balance.get();

        if (amount > balance) {
            throw new BankAccountActionInvalidException("Cannot withdraw more money than is currently in the account");
        }
        
        this.balance.set(balance - amount);
    }

}