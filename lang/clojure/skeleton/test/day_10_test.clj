(ns day-10-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-10 :refer [part1 part2]]))

(deftest day-10-test
  (testing "sample data"
    (is (= 0 (part1 "../data/10-sample.txt")))
    (is (= 0 (part2 "../data/10-sample.txt")))))
