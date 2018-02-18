package Reusability.models;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class ItemBuyer {
    Buyer buyer;
    Item item;

    public ItemBuyer() {
    }

    public ItemBuyer(Buyer buyer, Item item) {
        this.buyer = buyer;
        this.item = item;
    }

    public Buyer getBuyer() {
        return buyer;
    }

    public void setBuyer(Buyer buyer) {
        this.buyer = buyer;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}
